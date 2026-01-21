class House
  def recite
    (1..12).to_a.map { |n| line(n) }.join("\n")
  end

  def line(number)
    HouseLine.for(number).line
  end
end

class HouseLine
  def self.for(number)
    case number
    when 1
      HouseLine1.new(number)
    else
      RepeatingHouseLine.new(number)
    end
  end
end

class HouseLine1
  attr_reader :number, :bit_name_generator
  def initialize(number, bit_name_generator: BitName)
    @number = number
    @bit_name_generator = bit_name_generator
  end

  def line
    "This is " + 
      bit_name + 
      "the house that Jack built.\n"
  end

  private
  def bit_name
    bit_name_generator.for(number)
  end
end

class RepeatingHouseLine
  attr_reader :number, :bit_name_generator
  def initialize(number, bit_name_generator: BitName)
    raise ArgumentError "number should be 2 or higher" if number < 2
    @number = number
    @bit_name_generator = bit_name_generator
  end

  def line
    "This is " + 
      repeating_bit_name +
      " that lay in " + 
      "the house that Jack built." + "\n"
  end

  private
  def repeating_bit_name
    number.downto(2).to_a.map{ |n| bit_name_generator.for(n) }.join(" ")
  end
end

class BitName
  def self.for(number)
    case number
    when 2
      "the malt"
    when 3
      "the rat that ate"
    when 4
      "the cat that killed"
    when 5
      "the dog that worried"
    when 6
      "the cow with the crumpled horn that tossed"
    when 7
      "the maiden all forlorn that milked"
    when 8
      "the man all tattered and torn that kissed"
    when 9
      "the priest all shaven and shorn that married"
    when 10
      "the rooster that crowed in the morn that woke"
    when 11
      "the farmer sowing his corn that kept"
    when 12
      "the horse and the hound and the horn that belonged to"
    else
      ""
    end
  end
end
