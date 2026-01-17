class Bottles
  def initialize
  end

  def song
    verses(99,0)
  end

  def verses(start_verse, end_verse)
    verse_range = end_verse..start_verse
    reversed_verse_range = verse_range.to_a.reverse
    reversed_verse_range.map do |n, i|
      verse(n)
    end.join("\n")
  end

  def verse(number)
    case number
    when 0
      verse_0
    when 1
      verse_1
    when 2
      verse_2
    else
      verse_99_3(number)
    end

  end

  def verse_99_3(number)
    next_number = number - 1
    str = "#{number} bottles of beer on the wall, " +
      "#{number} bottles of beer.\n" +
      "Take one down and pass it around, " +
      "#{next_number} bottles of beer on the wall.\n"
    str
  end

  def verse_2(number = 2)
    next_number = number - 1
    str = "#{number} bottles of beer on the wall, " +
      "#{number} bottles of beer.\n" +
      "Take one down and pass it around, " +
      "#{next_number} bottle#{next_number == 1 ? '' : 's'} of beer on the wall.\n"
    str
  end

  def verse_1
    "1 bottle of beer on the wall, " +
    "1 bottle of beer.\n" +
    "Take it down and pass it around, " +
    "no more bottles of beer on the wall.\n"
  end

  def verse_0
    "No more bottles of beer on the wall, " +
    "no more bottles of beer.\n" +
    "Go to the store and buy some more, " +
    "99 bottles of beer on the wall.\n"
  end

  private
  def bottle_string(number)
    
  end
end
