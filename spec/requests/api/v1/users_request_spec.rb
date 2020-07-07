
RSpec.describe "Api::V1::Users", type: :request do

  describe 'POST api/v1/users' do
    let(:user_attributes) { attributes_for(:user) }
    let(:user_params) {user_attributes.merge(password_confirmation: user_attributes[:password])}
    before do
      post '/api/v1/users', params: user_params
    end
    context 'when input valid params for register new user' do
      it 'sign up user with success' do
        expect(response.body).to match_json_schema('user')

        expect(response).to have_http_status(:created)
      end
    end
  end

end
