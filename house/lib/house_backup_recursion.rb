### ATTENTION: BACKUP ###


class House

  def recite
    (1..12).to_a.map { |n| line(n) }.join("\n")
  end

  def line(number)
    HouseLine.new(number).line
  end
end

class HouseLine
  attr_reader :number
  def initialize(number)
    @number = number
  end

  def line
    case number
    when 1
      HouseLine1.new(number).line
    when 2..12
      RepeatingHouseLine.new(number).line
    else
      ""
    end
  end
end

class RepeatingHouseLine
  attr_reader :number
  def initialize(number)
    @number = number
  end

  def line
    "This is " + 
    RepeatingHouseLineBit.new(number).bit +
    " that lay in the house" + " that Jack built." + "\n"
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

class RepeatingHouseLineBit
  attr_reader :number, :bit_name
  def initialize(number, bit_name_generator: BitName)
    @number = number
    @bit_name = bit_name_generator.for(number)
  end

  def bit
    bit_name + 
      (number > 2 ? " " : "") + 
      (number > 1 ? RepeatingHouseLineBit.new(number - 1).bit : "")
  end
end

class HouseLine1
  attr_reader :number
  def initialize(number)
    @number = number
  end

  def line
    "This is the house that Jack built.\n"
  end
end

