class EnglishArmy < Army
  def generate_units
    10.times { units << PikemanUnit.new }
    10.times { units << ArcherUnit.new }
    10.times { units << KnightUnit.new }
  end
end
