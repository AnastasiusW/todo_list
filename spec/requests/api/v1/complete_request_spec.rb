RSpec.describe 'Api::V1::Complete', type: :request do
  include Docs::V1::Complete::Api
  let(:user) { create(:user) }
  let(:project) { create(:project, user: user) }
  let(:token) { JsonWebTokenService.encode(user_id: user.id) }
  let(:headers) { { authorization: token, accept: 'application/json' } }
  let(:project_id) { project.id }

  describe 'PATCH api/v1/projects/:project_id/tasks/:id/complete' do
    include Docs::V1::Complete::Update

    let(:task) { create(:task, project: project) }
    let(:invalid_id_task) { 0 }

    context 'with input valid done parameter' do
      let(:params) { { id: task.id, done: true } }

      it 'update task and return status 200', :dox do
        expect do
          patch "/api/v1/projects/#{project_id}/tasks/#{task.id}/complete/#{task.id}",
                headers: headers, params: params
        end .to change { Task.find_by(id: task).done }.from(false).to(true)

        expect(response.body).to match_json_schema('task')
        expect(response).to have_http_status(:ok)
      end
    end
  end
end
