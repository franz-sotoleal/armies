class Unit < ApplicationRecord
  belongs_to :army

  def add_strength(amount)
    self.strength += amount
  end

  private

  def can_transform
    true
  end
end
