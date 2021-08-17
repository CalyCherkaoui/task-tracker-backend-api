require 'rails_helper'

RSpec.describe 'UsersController', type: :request do
  let(:user) { create_user }
  let(:existing_user) { create_user }

  context 'When searching for a user' do
    before do
      login_with_api(user)
      get "/api/v1/users/#{user.id}", headers: {
        Authorization: response.headers['Authorization']
      }
    end

    it 'returns 200' do
      expect(response.status).to eq(200)
    end

    it 'returns the user' do
      expect(json['data']).to have_id(user.id.to_s)
      expect(json['data']).to have_type('users')
    end
  end

  context 'When serching for a different user than the logged-in one' do
    before do
      login_with_api(user)
      get "/api/v1/users/#{existing_user.id}", headers: {
        Authorization: response.headers['Authorization']
      }
    end

    it 'returns 404' do
      expect(response.status).to eq(401)
    end
  end

  context 'When the Authorization token in the header is missing' do
    before do
      get "/api/v1/users/#{user.id}"
    end

    it 'returns 401' do
      expect(response.status).to eq(401)
    end
  end
end
