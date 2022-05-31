require 'rails_helper'

RSpec.describe 'Units', type: :request do
  let!(:army) { create(:english_army) }
  let!(:unit) { army.units.first }

  let!(:broke_army) { create(:chinese_army, coins: 1) }
  let!(:broke_army_unit) { broke_army.units.first }
  let!(:broke_army_knight_unit) { broke_army.units.select { |u| u.is_a? KnightUnit }.first }

  describe 'GET /index' do
    it 'renders a successful response', doc_title: 'Lists the units for an army' do
      get army_units_url(army_id: army.id), as: :json
      expect(response).to be_successful
    end
  end

  describe 'GET /show' do
    it 'renders a successful response', doc_title: 'Shows a specific unit for an army' do
      get army_unit_url(army_id: army.id, id: unit.id), as: :json
      expect(response).to be_successful
    end
  end

  describe 'POST /train' do
    context 'with valid parameters' do
      it 'trains a PikemanUnit', doc_title: 'Trains a Pikeman' do
        post army_unit_train_url(army_id: army.id, unit_id: unit.id), as: :json
        expect(response).to be_successful
      end
    end

    context 'with invalid parameters' do
      it 'does not find the Unit', doc_title: 'Does not find the unit to train' do
        post army_unit_train_url(army_id: army.id, unit_id: broke_army_unit.id), as: :json
        expect(response).to have_http_status(:not_found)
      end

      it 'does not train the Unit (not enough coins)', doc_title: 'Does not train the unit (not enough coins)' do
        post army_unit_train_url(army_id: broke_army.id, unit_id: broke_army_unit.id), as: :json
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'POST /transform' do
    context 'with valid parameters' do
      it 'transforms a PikemanUnit', doc_title: 'Transforms a pikeman' do
        post army_unit_transform_url(army_id: army.id, unit_id: unit.id), as: :json
        expect(response).to be_successful
      end
    end

    context 'with invalid parameters' do
      it 'does not find the Unit', doc_title: 'Does not find the unit to transform' do
        post army_unit_transform_url(army_id: army.id, unit_id: broke_army_unit.id), as: :json
        expect(response).to have_http_status(:not_found)
      end

      it 'does not transform the Unit (not enough coins)',
         doc_title: 'Does not transform the unit (not enough coins)' do
        post army_unit_transform_url(army_id: broke_army.id, unit_id: broke_army_unit.id), as: :json
        expect(response).to have_http_status(:unprocessable_entity)
      end

      it 'does not transform the KnightUnit', doc_title: 'Does not transform the knight' do
        post army_unit_transform_url(army_id: broke_army.id, unit_id: broke_army_knight_unit.id), as: :json
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end
