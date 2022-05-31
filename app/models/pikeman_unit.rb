class PikemanUnit < Unit
  attribute :strength, :integer, default: 5

  def train
    add_strength 3
    army.subtract_coins 10
  end

  def transform
    army.transform(self, ArcherUnit.new, 30)
  end
end
