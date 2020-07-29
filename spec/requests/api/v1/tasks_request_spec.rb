RSpec.describe 'Api::V1::Tasks', type: :request do
  include Docs::V1::Tasks::Api
  let(:user) { create(:user) }
  let(:project) { create(:project, user: user) }
  let(:token) { JsonWebToken.encode(user_id: user.id) }
  let(:headers) { { authorization: token, accept: 'application/json' } }
  let(:project_id) { project.id }

  describe 'GET api/v1/projects/:project_id/tasks' do
    include Docs::V1::Tasks::Index
    before do
      create_list(:task, 2, project: project)
    end

    context 'when input valid project_id params' do
      let(:params) { { project_id: project.id } }

      before do
        get "/api/v1/projects/#{project_id}/tasks", headers: headers, params: params
      end

      it 'show list of tasks and return status code 200', :dox do
        expect(response.body).to match_json_schema('tasks')
        expect(response).to have_http_status(:ok)
      end
    end

    context 'when input invalid headers' do
      let(:params) { { project_id: project.id } }
      let(:invalid_token) { nil }
      let(:invalid_headers) { { authorization: invalid_token, accept: 'application/json' } }

      before do
        get "/api/v1/projects/#{project_id}/tasks", headers: invalid_headers, params: params
      end

      it 'show list of tasks and return status code 401', :dox do
        expect(response.body).to match_json_schema('standard_error')

        expect(response).to have_http_status(:unauthorized)
      end
    end

    context 'when input invalid project_id params' do
      let(:invalid_project) { 0 }
      let(:params) { { project_id: invalid_project } }

      before do
        get "/api/v1/projects/#{invalid_project}/tasks", headers: headers, params: params
      end

      it 'show list of comments and return status code 404', :dox do
        expect(response.body).to match_json_schema('standard_error')
        expect(response).to have_http_status(:not_found)
      end
    end
  end

  describe 'SHOW api/v1/projects/:project_id/tasks/:id' do
    include Docs::V1::Tasks::Show

    let(:params) { { id: task.id, project_id: project.id } }
    let(:task) { create(:task, project: project) }

    context 'when input valid params,test will pass with success' do
      before do
        get "/api/v1/projects/#{project_id}/tasks/#{task.id}", headers: headers, params: params
      end

      it 'return tasks of project', :dox do
        expect(response).to have_http_status(:ok)
        expect(response.body).to match_json_schema('task')
      end
    end

    context 'when input invalid params,test will pass with fail' do
      let(:params) { { id: invalid_task_id } }
      let(:invalid_task_id) { 0 }

      before do
        get "/api/v1/projects/#{project_id}/tasks/#{invalid_task_id}", headers: headers, params: params
      end

      it 'do not show task', :dox do
        expect(response).to have_http_status(:not_found)
      end
    end
  end

  describe 'POST api/v1/projects/:project_id/tasks' do
    include Docs::V1::Tasks::Create

    let(:params) { { project_id: project.id } }

    before do
      post "/api/v1/projects/#{project_id}/tasks", headers: headers, params: params
    end

    context 'when input valid params, test will pass with success' do
      let(:attributes) { attributes_for(:task) }
      let(:params) { { project_id: project.id, name: attributes[:name], deadline: attributes[:deadline] } }

      it 'create new task and return status code 201', :dox do
        expect(response.body).to match_json_schema('task')
        expect(response).to have_http_status(:created)
      end
    end

    context 'when input invalid params,test will pass with fail' do
      let(:params) { { project_id: project.id, name: '' } }

      it 'do not create task, because inputs empty task name', :dox do
        expect(response.body).to match_json_schema('validation_error')
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'PATCH api/v1/projects/:project_id/tasks/:id' do
    include Docs::V1::Tasks::Update

    let(:task) { create(:task, project: project) }

    before do
      put "/api/v1/projects/#{project_id}/tasks/#{task.id}", headers: headers, params: params
    end

    describe 'test will pass with success ' do
      let(:attributes) { attributes_for(:task) }

      context 'with input valid name' do
        let(:params) {  { id: task.id, name: attributes[:name] } }

        it 'update task and return status 200', :dox do
          expect(response.body).to match_json_schema('task')
          expect(response).to have_http_status(:ok)
        end
      end

      context 'with input valid deadline' do
        let(:params) {  { id: task.id, deadline: attributes[:deadline] } }

        it 'update task and return status 200', :dox do
          expect(response.body).to match_json_schema('task')
          expect(response).to have_http_status(:ok)
        end
      end
    end

    describe 'test will pass with fail ' do
      context 'with input invalid empty name' do
        let(:params) {  { id: task.id, name: '' } }

        it 'update task and return status 422', :dox do
          expect(response).to have_http_status(:unprocessable_entity)
        end
      end
    end
  end

  describe 'PATCH api/v1/projects/:project_id/tasks/:id/position' do
    include Docs::V1::Tasks::Position

    let!(:task1) { create(:task, project: project, position: 1) }
    let!(:task2) { create(:task, project: project, position: 2) }
    let!(:task3) { create(:task, project: project, position: 3) }

    describe 'test will pass with success ' do
      context 'with  input move_up position' do
        let(:params) {  { id: task2.id, position: 'move_up' } }

        it 'update task and return status 200', :dox do
          expect do
            patch "/api/v1/projects/#{project_id}/tasks/#{task2.id}/position",
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
            patch "/api/v1/projects/#{project_id}/tasks/#{task2.id}/position",
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
          patch "/api/v1/projects/#{project_id}/tasks/#{task2.id}/position", headers: headers, params: params
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
          patch "/api/v1/projects/#{project_id}/tasks/#{invalid_id_task}/position", headers: headers, params: params
        end

        it 'do not update position, invalid id task', :dox do
          expect(response).to have_http_status(:not_found)
        end
      end
    end
  end

  describe 'PATCH api/v1/projects/:project_id/tasks/:id/complete' do
    include Docs::V1::Tasks::Complete

    let(:task) { create(:task, project: project) }
    let(:invalid_id_task) { 0 }

    context 'with input valid done parameter' do
      let(:params) { { id: task.id, done: true } }

      it 'update task and return status 200', :dox do
        expect do
          patch "/api/v1/projects/#{project_id}/tasks/#{task.id}/complete",
                headers: headers, params: params
        end .to change { Task.find_by(id: task).done }.from(false).to(true)

        expect(response.body).to match_json_schema('task')
        expect(response).to have_http_status(:ok)
      end
    end
  end

  describe 'DELETE api/v1/projects/:project_id/tasks/:id' do
    include Docs::V1::Tasks::Destroy

    let!(:task) { create(:task, project: project) }
    let(:invalid_id_task) { 0 }

    context 'when input valid id task' do
      let(:params) { { id: task.id } }

      it 'task will be deleted with success', :dox do
        expect do
          delete "/api/v1/projects/#{project_id}/tasks/#{task.id}",
                 headers: headers, params: params
        end .to change(Task, :count).by(-1)

        expect(response).to have_http_status(:ok)
      end
    end

    context 'when input invalid id task' do
      let(:params) { { id: invalid_id_task } }

      it 'task will be deleted with fail', :dox do
        expect do
          delete "/api/v1/projects/#{project_id}/tasks/#{invalid_id_task}",
                 headers: headers, params: params
        end .to change(Task, :count).by(0)

        expect(response).to have_http_status(:not_found)
      end
    end
  end
end
