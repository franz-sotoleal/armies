require 'rails_helper'

RSpec.describe Army, type: :model do
  context 'by default' do
    let(:default_coin_count) { 2000 }
    let(:chinese_army) { build(:chinese_army) }
    let(:english_army) { build(:english_army) }
    let(:byzantine_army) { build(:byzantine_army) }

    it 'starts with default coins' do
      expect(chinese_army.coins).to eq(default_coin_count)
      expect(english_army.coins).to eq(default_coin_count)
      expect(byzantine_army.coins).to eq(default_coin_count)
    end

    it 'deduces the given coins' do
      expect { chinese_army.subtract_coins(100) }.to change { chinese_army.coins }.by(-100)
    end
  end

  context 'english army' do
    let!(:english_army) { EnglishArmy.create }
    let(:pikeman) { english_army.units.first }

    it 'trains a pikeman and deduces the given coins' do
      expect do
        pikeman.train
        english_army.save
      end.to change { english_army.coins }.by(-10).and change { pikeman.strength }.to(8)
    end

    it 'transforms a pikeman to an archer and deduces the given coins' do
      expect { pikeman.transform }.to change { english_army.coins }.by(-30)
    end
  end
end
