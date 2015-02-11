require 'rails_helper'

describe Api::V1::UsersController do
  describe 'GET #show' do
    let(:user) { create(:user) }

    it 'returns unauthorized' do
      get :show, id: user.id

      expect(response).to have_http_status(:unauthorized)
    end

    before(:each) { get :show, id: user.id, access_token: user.authentication_token }

    it 'returns 200 OK' do
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

    it 'returns 200 OK' do
      expect(response).to have_http_status(:ok)
    end

    it 'returns the updated User object' do
      user_json = { 'id' => user.id, 'name' => 'Batman' }

      expect(json).to eq(user_json)
    end
  end

  describe 'DELETE #destroy' do
    let(:user) { create(:user) }

    it 'returns unauthorized' do
      delete :destroy, id: user.id

      expect(response).to have_http_status(:unauthorized)
    end

    before(:each) do
      delete :destroy, id: user.id, access_token: user.authentication_token
    end

    it 'returns 200 OK' do
      expect(response).to have_http_status(:ok)
    end

    it 'delete User from DB' do
      expect(User.all).not_to include user
    end

    let(:new_user) { create(:user) }
    it 'returns 404 Not Found for second same request' do
      delete :destroy, id: user.id, access_token: new_user.authentication_token

      expect(response).to have_http_status(:not_found)
    end
  end
end
