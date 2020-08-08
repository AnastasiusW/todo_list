RSpec.describe 'Api::V1::Position', type: :request do
  include Docs::V1::Position::Api
  let(:user) { create(:user) }
  let(:project) { create(:project, user: user) }
  let(:token) { JsonWebTokenService.encode(user_id: user.id) }
  let(:headers) { { authorization: token, accept: 'application/json' } }
  let(:project_id) { project.id }

  describe 'PATCH api/v1/projects/:project_id/tasks/:id/position' do
    include Docs::V1::Position::Update

    let!(:task1) { create(:task, project: project, position: 1) }
    let!(:task2) { create(:task, project: project, position: 2) }
    let!(:task3) { create(:task, project: project, position: 3) }

    describe 'test will pass with success ' do
      context 'with  input move_up position' do
        let(:params) {  { id: task2.id, position: 'move_up' } }

        it 'update task and return status 200', :dox do
          expect do
            patch "/api/v1/projects/#{project_id}/tasks/#{task2.id}/position/#{task2.id}",
                  headers: headers, params: params
          end .to change {
                    Task.find_by(id: task2.id).position
                  } .from(2).to(1)
            .and change { Task.find_by(id: task1.id).position }.from(1).to(2)
          expect(response.body).to match_json_schema('task')
          expect(response).to have_http_status(:ok)
        end
      end

      context 'with  input move_down position' do
        let(:params) {  { id: task2.id, position: 'move_down' } }

        it 'update task and return status 200', :dox do
          expect do
            patch "/api/v1/projects/#{project_id}/tasks/#{task2.id}/position/#{task2.id}",
                  headers: headers, params: params
          end .to change { Task.find_by(id: task2.id).position }.from(2).to(3)
                                                                .and change { Task.find_by(id: task3.id).position }
            .from(3).to(2)
          expect(response.body).to match_json_schema('task')
          expect(response).to have_http_status(:ok)
        end
      end
    end

    describe 'test will pass with fail ' do
      let(:params) { { id: task2.id, position: FFaker::Lorem.word } }

      context 'with  invalid position' do
        before do
          patch "/api/v1/projects/#{project_id}/tasks/#{task2.id}/position/#{task2.id}",
                headers: headers, params: params
        end

        it 'do not update position, invalid position', :dox do
          expect(response.body).to match_json_schema('standard_error')
          expect(response).to have_http_status(:unprocessable_entity)
        end
      end

      context 'with  invalid id task' do
        let(:params) { { id: nil, position: 'move_down' } }
        let(:invalid_id_task) { 0 }

        before do
          patch "/api/v1/projects/#{project_id}/tasks/#{invalid_id_task}/position/#{invalid_id_task}",
                headers: headers, params: params
        end

        it 'do not update position, invalid id task', :dox do
          expect(response).to have_http_status(:not_found)
        end
      end
    end
  end
end
