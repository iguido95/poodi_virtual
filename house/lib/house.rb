DATA = [
  "the horse and the hound and the horn that belonged to",
  "the farmer sowing his corn that kept",
  "the rooster that crowed in the morn that woke",
  "the priest all shaven and shorn that married",
  "the man all tattered and torn that kissed",
  "the maiden all forlorn that milked",
  "the cow with the crumpled horn that tossed",
  "the dog that worried",
  "the cat that killed",
  "the rat that ate",
  "the malt that lay in",
  ""
]

class House
  attr_reader :prefix
  def initialize(data: DATA, orderer: StandardOrderer.new, prefixer: StandardPhrasePrefixer.new)
    @data = orderer.order(data)
    @prefix = prefixer.prefix
  end

  def recite
    (1..12).to_a.map { |n| line(n) }.join("\n")
  end

  def line(number)
    prefix + " " + phrases.last(number).join(" ") + "the house that Jack built.\n"
  end

  def phrases
    @data
  end
end

class StandardPhrasePrefixer
  def prefix
    "This is"
  end
end

class PiratePhrasePrefixer
  def prefix
    "Ayy mate, this is"
  end
end

class StandardOrderer
  def order(data)
    data
  end
end

class RandomOrderer
  def order(data)
    data.shuffle
  end
end
