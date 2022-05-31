class ArcherUnit < Unit
  attribute :strength, :integer, default: 10

  def train
    add_strength 7
    army.subtract_coins 20
  end

  def transform
    army.transform(self, KnightUnit.new, 40)
  end
end
