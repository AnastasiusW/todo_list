require 'rails_helper'

RSpec.describe "Api::V1::Projects", type: :request do

  let(:user) {create(:user)}
  let(:token) { JsonWebToken.encode(user_id: user.id) }
  let(:headers) { { authorization: token, accept: 'application/json' } }


  describe 'POST api/v1/projects' do
  before do
    post '/api/v1/projects', headers: headers,params: params
  end
  context 'when input valid params for create new project' do
    let(:params) {{project: attributes_for(:project) }}
    it 'with succes' do
      end
  end

  context 'when input invalid params for create new project' do
    let(:params) {{project: {name: ''}} }
    it 'with fail' do
      expect(response.body).to match_json_schema('error')
        binding.pry
      end
    end
end
end
