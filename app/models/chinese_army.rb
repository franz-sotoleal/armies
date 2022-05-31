class ChineseArmy < Army
  def generate_units
    3.times { units << PikemanUnit.new }
    25.times { units << ArcherUnit.new }
    2.times { units << KnightUnit.new }
  end
end
