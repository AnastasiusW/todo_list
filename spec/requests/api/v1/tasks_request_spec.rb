RSpec.describe "Api::V1::Tasks", type: :request do
  let(:user) {create(:user)}
  let (:project){create(:project, user: user)}
  let(:token) { JsonWebToken.encode(user_id: user.id) }
  let(:headers) { { authorization: token, accept: 'application/json' } }

  describe 'POST api/v1/tasks' do
    let(:params) { {project_id: project.id } }

    before do
      post '/api/v1/tasks', headers: headers,params: params
    end

    context 'when input valid params' do

      let(:params) { { project_id: project.id, name: name } }
      let(:name) { FFaker::Lorem.word }


      it 'with success' do
         expect(response.body).to match_json_schema('task')
        expect(response).to have_http_status(:created)

      end
    end

    context 'when input invalid params' do

      let(:params) {{project_id:project.id, name: ''}}

      it 'with fail, because inputs empty task name' do
        expect(response.body).to match_json_schema('error')
       expect(response).to have_http_status(:unprocessable_entity)
        end
      end

  end
end
