require 'rails_helper'

# rubocop:disable Metrics/BlockLength, Lint/RedundantCopDisableDirective
RSpec.describe 'Registrations', type: :request do
  let(:user) { build_user }
  let(:existing_user) { create_user }
  let(:signup_url) { '/api/v1/signup' }

  context 'When registrating a new user' do
    before do
      post signup_url, params: {
        user: {
          username: user.username,
          email: user.email,
          password: user.password
        }
      }
    end

    it 'returns Ok status 200' do
      expect(response.status).to eq(200)
    end

    it 'returns a token in headers' do
      expect(response.headers['Authorization']).to be_present
    end

    it 'returns the user data' do
      expect(json['data']).to have_attribute(:email).with_value(user.email)
    end
  end

  context 'When an email already exists' do
    before do
      post signup_url, params: {
        user: {
          username: existing_user.username,
          email: existing_user.email,
          password: existing_user.password
        }
      }
    end

    it 'returns status 400' do
      expect(response.status).to eq(400)
    end
  end
end
# rubocop:enable Metrics/BlockLength, Lint/RedundantCopDisableDirective
