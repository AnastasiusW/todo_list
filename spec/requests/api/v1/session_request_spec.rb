RSpec.describe 'Api::V1::Session', type: :request do
  include Docs::V1::Session::Api

  describe 'POST api/v1/sign_in' do
    include Docs::V1::Session::Create

    let(:user) { create(:user) }

    before do
      post '/api/v1/sign_in', params: user_params
    end

    context 'when input valid params' do
      let(:user_params) { { user_name: user.user_name, password: user.password } }

      it 'sign in with success', :dox do
        expect(response.body).to match_json_schema('session')

        expect(response).to have_http_status(:ok)
      end
    end

    context 'when input invalid params' do
      let(:user_params) { { user_name: 'invalid', password: 'invalid' } }

      it 'sign in with fail', :dox do
        expect(response.body).to match_json_schema('standard_error')
        expect(response).to have_http_status(:not_found)
      end
    end
  end
end
