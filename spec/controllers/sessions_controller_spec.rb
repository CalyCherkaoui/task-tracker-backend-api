require 'rails_helper'

# rubocop:disable Metrics/BlockLength, Lint/RedundantCopDisableDirective
RSpec.describe 'Sessions', type: :request do
  let(:user) { create_user }
  let(:login_url) { '/api/v1/login' }
  let(:logout_url) { '/api/v1/logout' }

  context 'When logging in' do
    before do
      login_with_api(user)
    end

    it 'returns an authorization token' do
      expect(response.headers['Authorization']).to be_present
    end

    it 'returns ok http status 200' do
      expect(response.status).to eq(200)
    end
  end

  context 'When password is missing' do
    before do
      post login_url, params: {
        user: {
          username: user.username,
          email: user.email,
          password: nil
        }
      }
    end

    it 'returns http status 401' do
      expect(response.status).to eq(401)
    end
  end

  context 'When logging out' do
    before do
      login_with_api(user)
    end

    it 'returns http status 204' do
      delete '/api/v1/logout', headers: { 'Authorization' => response.headers['Authorization'] }

      expect(response).to have_http_status(200)
    end
  end
end
# rubocop:enable Metrics/BlockLength, Lint/RedundantCopDisableDirective
