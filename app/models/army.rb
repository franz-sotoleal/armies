class Army < ApplicationRecord
  attribute :coins, :integer, default: 2000
  has_many :units, dependent: :destroy
  before_create :generate_units

  validates_numericality_of :coins, only_integer: true, greater_than_or_equal_to: 0

  def subtract_coins(amount)
    self.coins -= amount
  end

  def transform(old_unit, new_unit, cost)
    subtract_coins(cost)
    old_unit.destroy
    units << new_unit
  end
end
