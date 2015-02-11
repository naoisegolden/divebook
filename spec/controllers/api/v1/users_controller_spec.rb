require 'rails_helper'

describe Api::V1::UsersController do
  describe 'GET #show' do
    let(:user) { create(:user) }

    it 'returns unauthorized' do
      get :show, id: user.id

      expect(response).to have_http_status(:unauthorized)
    end

    before(:each) { get :show, id: user.id, access_token: user.authentication_token }

    it 'returns success' do
      expect(response).to have_http_status(:ok)
    end

    it 'returns the User object' do
      user_json = { 'id' => user.id, 'name' => user.name }

      expect(json).to eq(user_json)
    end
  end

  describe 'PUT #update' do
    let(:user) { create(:user) }

    it 'returns unauthorized' do
      put :update, id: user.id

      expect(response).to have_http_status(:unauthorized)
    end

    before(:each) do
      put :update, id: user.id, name: 'Batman', access_token: user.authentication_token
    end

    it 'returns success' do
      expect(response).to have_http_status(:ok)
    end

    it 'returns the updated User object' do
      user_json = { 'id' => user.id, 'name' => 'Batman' }

      expect(json).to eq(user_json)
    end
  end
end
