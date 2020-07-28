RSpec.describe 'Api::V1::Comments', type: :request do
  include Docs::V1::Comments::Api

  let(:user) { create(:user) }
  let(:project) { create(:project, user: user) }
  let(:task) { create(:task, project: project) }
  let(:token) { JsonWebToken.encode(user_id: user.id) }
  let(:headers) { { authorization: token, accept: 'application/json' } }
  let(:project_id) { project.id }
  let(:task_id) { task.id }

  describe 'GET api/v1/projects/:project_id/tasks/:task_id/comments', :dox do
    include Docs::V1::Comments::Index

    before do
      create_list(:comment, 2, task: task)
    end

    context 'when input valid task_id params' do
      let(:params) { { task_id: task.id } }

      before do
        get "/api/v1/projects/#{project_id}/tasks/#{task_id}/comments", headers: headers, params: params
      end

      it 'show list of comments and return status code 200' do
        expect(response.body).to match_json_schema('comments')
        expect(response).to have_http_status(:ok)
      end
    end

    context 'when input invalid task_id params' do
      let(:invalid_task) { 0 }
      let(:params) { { task_id: invalid_task } }

      before do
        get "/api/v1/projects/#{project_id}/tasks/#{invalid_task}/comments", headers: headers, params: params
      end

      it 'show list of comments and return status code 404' do
        expect(response.body).to match_json_schema('error')
        expect(response).to have_http_status(:not_found)
      end
    end
  end

  describe 'POST /api/projects/:project_id/tasks/:task_id/comments', :dox do
    include Docs::V1::Comments::Create
    before do
      post "/api/v1/projects/#{project_id}/tasks/#{task_id}/comments", headers: headers, params: params
    end

    context 'when input valid params', :dox do
      let(:params) { attributes_for(:comment) }

      it 'creates new comment and return status code 201' do
        expect(response.body).to match_json_schema('comment')
        expect(response).to have_http_status(:created)
      end
    end

    context 'when input invalid params empty body' do
      let(:params) { { project_id: project.id, task_id: task.id, body: '' } }

      it 'do not create task' do
        expect(response.body).to match_json_schema('error')
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'DELETE api/v1/projects/:project_id/tasks/:task_id/comments/:id', :dox do
    include Docs::V1::Comments::Destroy

    let!(:comment) { create(:comment, task: task) }
    let(:invalid_id_comment) { 0 }

    context 'when input valid id task' do
      let(:params) { { id: comment.id } }

      it 'task will be deleted with success', :dox do
        expect do
          delete "/api/v1/projects/#{project_id}/tasks/#{task_id}/comments/#{comment.id}",
                 headers: headers, params: params
        end .to change(Comment, :count).by(-1)

        expect(response).to have_http_status(:ok)
      end
    end

    context 'when input invalid id comment' do
      let(:params) { { id: invalid_id_comment } }

      it 'task will be not deleted', :dox do
        expect do
          delete "/api/v1/projects/#{project_id}/tasks/#{task_id}/comments/#{invalid_id_comment}",
                 headers: headers, params: params
        end .to change(Task, :count).by(0)

        expect(response).to have_http_status(:not_found)
      end
    end
  end
end
