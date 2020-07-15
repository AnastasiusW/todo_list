require 'rails_helper'

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
    let(:params) { { project: { id: project.id } } }
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
    before do
      post '/api/v1/projects', headers: headers, params: params
    end

    context 'when input valid params for create new project' do
      let(:params) { { project: attributes_for(:project) } }

      it 'with success' do
        expect(response.body).to match_json_schema('project')
        expect(response).to have_http_status(:created)
      end
    end

    context 'when input invalid params for create new project' do
      let!(:project) { create(:project, user: user) }

      let(:params) { { project: { name: project.name } } }

      it 'with fail, because inputs exist`s project name' do
        expect(response.body).to match_json_schema('error')
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'PUT api/v1/projects/:id' do
    let(:project) { create(:project, user: user) }

    before do
      put "/api/v1/projects/#{project.id}", headers: headers, params: params
    end

    context 'when input valid params for update project' do
      let(:name) { FFaker::Lorem.word }
      let(:params) { { project: { id: project.id, name: name } } }

      it 'with success' do
        expect(response.body).to match_json_schema('project')
        expect(response).to have_http_status(:ok)
      end
    end

    context 'when input invalid params for update project with fail :unprocessable_entity' do
      let(:params) { { project: { id: project.id, name: '' } } }

      it 'with fails, because name is empty' do
        expect(response.body).to match_json_schema('error')
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end

    context 'when input invalid params for update project' do
      let(:params) { { project: { id: nil, name: '' } } }

      it 'with fails, because name is empty and project_id is nil with not_found' do
        expect(response.body).to match_json_schema('error')
        expect(response).to have_http_status(:not_found)
      end
    end
  end

  describe 'DELETE api/v1/projects/:id' do
    let!(:project) { create(:project, user: user) }

    context 'when input valid params for delete project' do
      let(:params) { { project: { id: project.id } } }

      it 'with success' do
        expect { delete "/api/v1/projects/#{project.id}", headers: headers, params: params }.to change(Project, :count).by(-1)
        expect(response).to have_http_status(:ok)
      end
    end

    context 'when input invalid params for delete project' do
      let(:params) { { project: { id: 0 } } }

      it 'with fails, because id is invalid' do
        expect { delete "/api/v1/projects/#{project.id}", headers: headers, params: params }.to change(Project, :count).by(0)
        expect(response).to have_http_status(:not_found)
      end
    end
  end
end
