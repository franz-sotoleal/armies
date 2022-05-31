require 'rails_helper'

RSpec.describe '/units', type: :request do
  let!(:army) { create(:english_army) }
  let!(:unit) { army.units.first }

  let!(:broke_army) { create(:chinese_army, coins: 1) }
  let!(:broke_army_unit) { broke_army.units.first }
  let!(:broke_army_knight_unit) { broke_army.units.select {|u| u.is_a? KnightUnit}.first }

  describe 'GET /index' do
    it 'renders a successful response' do
      get army_units_url(army_id: army.id), as: :json
      expect(response).to be_successful
    end
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      get army_unit_url(army_id: army.id, id: unit.id), as: :json
      expect(response).to be_successful
    end
  end

  describe 'POST /train' do
    context 'with valid parameters' do
      it 'trains a PikemanUnit' do
        post army_unit_train_url(army_id: army.id, unit_id: unit.id), as: :json
        expect(response).to be_successful
      end
    end

    context 'with invalid parameters' do
      it 'does not find the Unit' do
        post army_unit_train_url(army_id: army.id, unit_id: broke_army_unit.id), as: :json
        expect(response).to have_http_status(:not_found)
      end
    end

    it 'does not train the Unit (not enough coins)' do
      post army_unit_train_url(army_id: broke_army.id, unit_id: broke_army_unit.id), as: :json
      expect(response).to have_http_status(:unprocessable_entity)
    end
  end

  describe 'POST /transform' do
    context 'with valid parameters' do
      it 'transforms a PikemanUnit' do
        post army_unit_transform_url(army_id: army.id, unit_id: unit.id), as: :json
        expect(response).to be_successful
      end
    end

    context 'with invalid parameters' do
      it 'does not find the Unit' do
        post army_unit_transform_url(army_id: army.id, unit_id: broke_army_unit.id), as: :json
        expect(response).to have_http_status(:not_found)
      end
    end

    it 'does not transform the Unit (not enough coins)' do
      post army_unit_transform_url(army_id: broke_army.id, unit_id: broke_army_unit.id), as: :json
      expect(response).to have_http_status(:unprocessable_entity)
    end

    it 'does not transform the KnightUnit' do
      post army_unit_transform_url(army_id: broke_army.id, unit_id: broke_army_knight_unit.id), as: :json
      expect(response).to have_http_status(:unprocessable_entity)
    end
  end
end
