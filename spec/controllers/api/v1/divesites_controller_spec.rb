require 'rails_helper'

describe Api::V1::DivesitesController do
  describe 'GET #index' do
    let(:user) { create(:user) }

    it 'returns unauthorized' do
      get :index

      expect(response).to have_http_status(:unauthorized)
    end

    before(:each) do
      @divesites = create_list(:divesite, 5)
      get :index, access_token: user.authentication_token
    end

    it 'returns 200 OK' do
      expect(response).to have_http_status(:ok)
    end

    it 'returns array of Dive Sites' do
      expect(json.count).to eq(@divesites.count)
    end

    it 'returns only two Dive Sites' do
      per_page = 2

      get :index,
          per_page: per_page,
          access_token: user.authentication_token

      expect(json.count).to eq(per_page)
    end
  end

  describe 'GET #index by User' do
    let(:user) { create(:user_with_3_divesites) }

    it 'returns array of Dive Sites by User' do
      get :index,
          user_id: user.id,
          access_token: user.authentication_token

      expect(json.count).to eq(user.divesites.count)
    end
  end

  describe 'POST #create' do
    let(:divesite) { build(:divesite) }
    let(:user)     { create(:user) }

    it 'returns unauthorized' do
      post :create,
            name: divesite.name,
            address: divesite.address

      expect(response).to have_http_status(:unauthorized)
    end

    before(:each) do
      post :create,
            name: divesite.name,
            address: divesite.address,
            access_token: user.authentication_token
    end

    it 'returns 201 Created' do
      expect(response).to have_http_status(:created)
    end

    it 'returns created Dive Site' do
      expect(json['name']).to    eq(divesite.name)
      expect(json['address']).to eq(divesite.address)
    end

    it 'returns 422 Unprocessable Entity if address not set' do
      post :create,
            name: divesite.name,
            access_token: user.authentication_token

      expect(response).to have_http_status(:unprocessable_entity)
    end
  end

  describe 'GET #show' do
    let(:divesite) { create(:divesite) }
    let(:user)     { create(:user) }

    it 'returns unauthorized' do
      get :show, id: divesite.id

      expect(response).to have_http_status(:unauthorized)
    end

    it 'returns 404 Not Found' do
      get :show, id: 1000000, access_token: user.authentication_token

      expect(response).to have_http_status(:not_found)
    end

    before(:each) { get :show, id: divesite.id, access_token: user.authentication_token }

    it 'returns 200 OK' do
      expect(response).to have_http_status(:ok)
    end

    it 'returns the Dive Site object' do
      expect(json['id']).to      eq(divesite.id)
      expect(json['name']).to    eq(divesite.name)
      expect(json['address']).to eq(divesite.address)
    end
  end

  describe 'PUT #update' do
    let(:divesite) { create(:divesite) }
    let(:new_name) { Faker::Company.name }
    let(:user)     { create(:user) }

    it 'returns unauthorized' do
      put :update, id: divesite.id

      expect(response).to have_http_status(:unauthorized)
    end

    before(:each) do
      put :update, id: divesite.id, name: new_name, access_token: user.authentication_token
    end

    it 'returns 200 OK' do
      expect(response).to have_http_status(:ok)
    end

    it 'returns the updated Dive Site object' do
      expect(json['name']).to eq(new_name)
    end
  end

  describe 'DELETE #destroy' do
    let(:divesite) { create(:divesite) }
    let(:user)     { create(:user) }

    it 'returns unauthorized' do
      delete :destroy, id: divesite.id

      expect(response).to have_http_status(:unauthorized)
    end

    before(:each) do
      delete :destroy, id: divesite.id, access_token: user.authentication_token
    end

    it 'returns 200 OK' do
      expect(response).to have_http_status(:ok)
    end

    it 'delete Dive Site from DB' do
      expect(Divesite.all).not_to include divesite
    end

    it 'returns 404 Not Found for second same request' do
      delete :destroy, id: divesite.id, access_token: user.authentication_token

      expect(response).to have_http_status(:not_found)
    end
  end
end
