class KnightUnit < Unit
  attribute :strength, :integer, default: 20

  validate :can_transform, on: :transform

  def train
    add_strength 10
    army.subtract_coins 30
  end

  def transform
  end

  private

  def can_transform
    # errors.add(:type, 'Invalid transformation')
    errors[:type] =  'Invalid transformation'
  end
end
