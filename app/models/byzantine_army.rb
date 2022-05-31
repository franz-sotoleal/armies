class ByzantineArmy < Army
  def generate_units
    5.times { units << PikemanUnit.new }
    8.times { units << ArcherUnit.new }
    15.times { units << KnightUnit.new }
  end
end
