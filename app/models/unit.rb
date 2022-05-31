class Unit < ApplicationRecord
  belongs_to :army

  def add_strength(amount)
    self.strength += amount
  end
end
