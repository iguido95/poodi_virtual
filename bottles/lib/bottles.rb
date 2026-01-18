class Bottles
  def song
    verses(99, 0)
  end

  def verses(upper, lower)
    upper.downto(lower).map { |i| verse(i) }.join("\n")
  end

  def container(number)
    case number
    when 0
      "no more bottles of beer"
    when 1
      "1 bottle of beer"
    when 6
      "1 six-pack of beer"
    else
      "#{number} bottles of beer"
    end
  end

  def next_action(number)
    case number
    when 0
      "Go to the store and buy some more"
    when 1
      "Take it down and pass it around"
    else
      "Take one down and pass it around"
    end
  end

  def next_number(number)
    case number
    when 0
      99
    else
      number - 1
    end
  end

  def verse(number)
    "#{container(number).capitalize} on the wall, #{container(number)}.\n#{next_action(number)}, #{container(next_number(number))} on the wall.\n"
  end


end
