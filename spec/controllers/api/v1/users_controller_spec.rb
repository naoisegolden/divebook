require 'rails_helper'

describe Api::V1::UsersController do
  describe 'GET #index' do
    let(:divesite) { create(:divesite_with_5_users) }
    let(:user) { divesite.users.first}

    it 'returns unauthorized' do
      get :index, divesite_id: divesite.id

      expect(response).to have_http_status(:unauthorized)
    end

    before(:each) do
      get :index, divesite_id: divesite.id, access_token: user.authentication_token
    end

    it 'returns 200 OK' do
      expect(response).to have_http_status(:ok)
    end

    it 'returns array of Dive Site users' do
      expect(json.count).to eq(divesite.users.count)
    end

    it 'returns only two Dive Site users' do
      per_page = 2

      get :index,
          divesite_id: divesite.id,
          per_page: per_page,
          access_token: user.authentication_token

      expect(json.count).to eq(per_page)
    end
  end

  describe 'GET #show' do
    let(:user) { create(:user) }

    it 'returns unauthorized' do
      get :show, id: user.id

      expect(response).to have_http_status(:unauthorized)
    end

    it 'returns 404 Not Found' do
      get :show, id: 100000, access_token: user.authentication_token

      expect(response).to have_http_status(:not_found)
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
    let(:new_name) { Faker::Name.name }

    it 'returns unauthorized' do
      put :update, id: user.id

      expect(response).to have_http_status(:unauthorized)
    end

    before(:each) do
      put :update, id: user.id, name: new_name, access_token: user.authentication_token
    end

    it 'returns 200 OK' do
      expect(response).to have_http_status(:ok)
    end

    it 'returns the updated User object' do
      expect(json['name']).to eq(new_name)
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

  describe 'POST #auth' do
    let(:user) { build(:user) }

    before(:each) do
      post :auth,
            name: user.name,
            email: user.email,
            password: user.password
    end

    it 'returns 201 Created' do
      expect(response).to have_http_status(:created)
    end

    it 'returns created User' do
      expect(json['name']).to eq(user.name)
      expect(json['email']).to eq(user.email)
    end

    it 'returns access token for the User' do
      expect(json['access_token']).to be
    end

    it 'returns 422 Unprocessable Entity after same request' do
      post :auth,
            name: user.name,
            email: user.email,
            password: user.password

      expect(response).to have_http_status(:unprocessable_entity)
    end
  end
end
