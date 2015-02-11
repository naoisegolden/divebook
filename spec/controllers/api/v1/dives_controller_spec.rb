require 'rails_helper'

describe Api::V1::DivesController do
  describe 'GET #index by User' do
    let(:user) { create(:user_with_3_divesites) }

    it 'returns unauthorized' do
      get :index

      expect(response).to have_http_status(:unauthorized)
    end

    before(:each) do
      get :index,
          user_id: user.id,
          access_token: user.authentication_token
    end

    it 'returns 200 OK' do
      expect(response).to have_http_status(:ok)
    end

    it 'returns array of Dives by User' do
      expect(json.count).to eq(user.dives.count)
      expect(json[0]['user_id']).to eq(user.id)
    end

    it 'returns only two Dives' do
      per_page = 2

      get :index,
          user_id: user.id,
          per_page: per_page,
          access_token: user.authentication_token

      expect(json.count).to eq(per_page)
    end
  end

  describe 'GET #index by Dive Site' do
    let(:user)     { create(:user) }
    let(:divesite) { create(:divesite_with_5_users) }

    before(:each) do
      get :index,
          divesite_id: divesite.id,
          access_token: user.authentication_token
    end

    it 'returns array of Dives by Dive Site' do
      expect(json.count).to eq(divesite.dives.count)
      expect(json[0]['divesite_id']).to eq(divesite.id)
    end

    it 'returns only two Dives' do
      per_page = 2

      get :index,
          divesite_id: divesite.id,
          per_page: per_page,
          access_token: user.authentication_token

      expect(json.count).to eq(per_page)
    end
  end


  describe 'POST #create' do
    let(:dive) { build(:dive) }
    let(:user) { create(:user, email: Faker::Internet.email) }

    it 'returns unauthorized' do
      post :create,
            user_id: dive.user_id,
            divesite_id: dive.divesite_id

      expect(response).to have_http_status(:unauthorized)
    end

    before(:each) do
      post :create,
            user_id: dive.user_id,
            divesite_id: dive.divesite_id,
            date: dive.date,
            access_token: user.authentication_token
    end

    it 'returns 201 Created' do
      expect(response).to have_http_status(:created)
    end

    it 'returns created Dive' do
      expect(json['user_id']).to     eq(dive.user_id)
      expect(json['divesite_id']).to eq(dive.divesite_id)
    end

    it 'returns 422 Unprocessable Entity if User not set' do
      post :create,
            divesite_id: dive.divesite_id,
            date: dive.date,
            access_token: user.authentication_token

      expect(response).to have_http_status(:unprocessable_entity)
    end

    it 'returns 422 Unprocessable Entity if Dive Site not set' do
      post :create,
            user_id: dive.user_id,
            date: dive.date,
            access_token: user.authentication_token

      expect(response).to have_http_status(:unprocessable_entity)
    end
  end

  describe 'GET #show' do
    let(:dive) { create(:dive) }

    it 'returns unauthorized' do
      get :show, id: dive.id

      expect(response).to have_http_status(:unauthorized)
    end

    it 'returns 404 Not Found' do
      get :show, id: 1000000, access_token: dive.user.authentication_token

      expect(response).to have_http_status(:not_found)
    end

    before(:each) { get :show, id: dive.id, access_token: dive.user.authentication_token }

    it 'returns 200 OK' do
      expect(response).to have_http_status(:ok)
    end

    it 'returns the Dive Site object' do
      expect(json['user_id']).to     eq(dive.user_id)
      expect(json['divesite_id']).to eq(dive.divesite_id)
    end
  end

  describe 'PUT #update' do
    let(:dive)     { create(:dive) }
    let(:new_user) { create(:user, email: Faker::Internet.email) }

    it 'returns unauthorized' do
      put :update, id: dive.id

      expect(response).to have_http_status(:unauthorized)
    end

    before(:each) do
      put :update, id: dive.id, user_id: new_user.id, access_token: dive.user.authentication_token
    end

    it 'returns 200 OK' do
      expect(response).to have_http_status(:ok)
    end

    it 'returns the updated Dive object' do
      expect(json['user_id']).to eq(new_user.id)
    end
  end

  describe 'DELETE #destroy' do
    let(:dive) { create(:dive) }

    it 'returns unauthorized' do
      delete :destroy, id: dive.id

      expect(response).to have_http_status(:unauthorized)
    end

    before(:each) do
      delete :destroy, id: dive.id, access_token: dive.user.authentication_token
    end

    it 'returns 200 OK' do
      expect(response).to have_http_status(:ok)
    end

    it 'delete Dive from DB' do
      expect(Dive.all).not_to include dive
    end

    it 'returns 404 Not Found for second same request' do
      delete :destroy, id: dive.id, access_token: dive.user.authentication_token

      expect(response).to have_http_status(:not_found)
    end
  end
end
