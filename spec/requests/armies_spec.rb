require 'rails_helper'

RSpec.describe 'Armies', type: :request do
  let!(:army) { create(:english_army) }
  let!(:another_army) { create(:chinese_army) }

  let(:valid_attributes) do
    { type: 'EnglishArmy' }
  end

  describe 'GET /index' do
    it 'renders a successful response', doc_title: 'Lists the armies' do
      get armies_url, as: :json
      expect(response).to be_successful
    end
  end

  describe 'GET /show' do
    it 'renders a successful response', doc_title: 'Shows a specific army' do
      get army_url(army), as: :json
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new Army', doc_title: 'Creates an army' do
        expect do
          post armies_url,
               params: { army: valid_attributes }, as: :json
        end.to change(Army, :count).by(1)
        expect(response).to have_http_status(:created)
      end
    end
  end
end
