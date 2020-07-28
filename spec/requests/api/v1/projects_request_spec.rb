RSpec.describe 'Api::V1::Projects', type: :request do
  include Docs::V1::Projects::Api
  let(:user) { create(:user) }
  let(:token) { JsonWebToken.encode(user_id: user.id) }
  let(:headers) { { authorization: token, accept: 'application/json' } }

  describe 'GET api/v1/projects' do
    include Docs::V1::Projects::Index

    before do
      create_list(:project, 3, user: user)
      get '/api/v1/projects', headers: headers
    end

    it 'return all list of projects of current user', :dox do
      expect(response).to have_http_status(:ok)

      expect(response.body).to match_json_schema('projects')
    end
  end

  describe 'SHOW api/v1/projects/:id' do
    include Docs::V1::Projects::Show

    let(:params) {  { id: project.id } }
    let(:project) { create(:project, user: user) }

    before do
      get "/api/v1/projects/#{project.id}", headers: headers, params: params
    end

    it 'return project of current user', :dox do
      expect(response).to have_http_status(:ok)
      expect(response.body).to match_json_schema('project')
    end
  end

  describe 'POST api/v1/projects' do
    include Docs::V1::Projects::Create

    before do
      post '/api/v1/projects', headers: headers, params: params
    end

    context 'when input valid params for create new project' do
      let(:params) { attributes_for(:project) }

      it 'create project and return status 201', :dox do
        expect(response.body).to match_json_schema('project')
        expect(response).to have_http_status(:created)
      end
    end

    context 'when input invalid params for create new project' do
      let!(:project) { create(:project, user: user) }

      let(:params) { { name: project.name } }

      it 'test fail, because inputs exist`s project name, return status 422', :dox do
        expect(response.body).to match_json_schema('error')
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'PATCH api/v1/projects/:id' do
    include Docs::V1::Projects::Update

    let(:project) { create(:project, user: user) }

    context 'when input valid params for update project' do
      before do
        patch "/api/v1/projects/#{project.id}", headers: headers, params: params
      end

      let(:name) { FFaker::Lorem.word }
      let(:params) {  { id: project.id, name: name } }

      it 'update task and return status 200', :dox do
        expect(response.body).to match_json_schema('project')
        expect(response).to have_http_status(:ok)
      end
    end

    context 'when input invalid params for update project with fail :unprocessable_entity' do
      let(:params) { { id: project.id, name: '' } }

      before do
        patch "/api/v1/projects/#{project.id}", headers: headers, params: params
      end

      it 'with fails, because name is empty, return status 422', :dox do
        expect(response.body).to match_json_schema('error')
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end

    context 'when input invalid params for update project' do
      let(:params) { { id: invalid_project_id, name: '' } }
      let(:invalid_project_id) { 0 }

      before do
        patch "/api/v1/projects/#{invalid_project_id}", headers: headers, params: params
      end

      it 'with fails, because name is empty and project_id is nil with not_found, return status 401', :dox do
        expect(response.body).to match_json_schema('error')
        expect(response).to have_http_status(:unauthorized)
      end
    end
  end

  describe 'DELETE api/v1/projects/:id' do
    include Docs::V1::Projects::Destroy

    let!(:project) { create(:project, user: user) }
    let(:invalid_id_project) { 0 }

    context 'when input valid params for delete project' do
      let(:params) { { id: project.id } }

      it 'project will be destroyed with success', :dox do
        expect do
          delete "/api/v1/projects/#{project.id}",
                 headers: headers, params: params
        end .to change(Project, :count).by(-1)
        expect(response).to have_http_status(:ok)
      end
    end

    context 'when input invalid params for delete project' do
      let(:params) { { id: invalid_id_project } }

      it 'with fails, because id is invalid', :dox do
        expect do
          delete "/api/v1/projects/#{invalid_id_project}",
                 headers: headers, params: params
        end .to change(Project, :count).by(0)
        expect(response).to have_http_status(:unauthorized)
      end
    end
  end
end
