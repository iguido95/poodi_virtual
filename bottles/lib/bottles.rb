class Bottles
  def song
    verses(99, 0)
  end

  def verses(upper, lower)
    upper.downto(lower).map { |i| verse(i) }.join("\n")
  end

  def verse(number)
    "#{no_of_containers(number).capitalize} of beer on the wall, #{no_of_containers(number)} of beer.\n#{action(number)}, #{no_of_containers(next_number(number))} of beer on the wall.\n"
  end

  def action(number)
    if number == 0
      "Go to the store and buy some more"
    else
      "Take #{container_reference(number)} down and pass it around"
    end
  end

  def next_number(number)
    if number == 0
      99
    else
      number - 1
    end
  end

  def no_of_containers(number)
    if number == 0
      "no more #{container(number)}"
    else
      "#{number} #{container(number)}"
    end
  end

  def container(number)
    if number == 1
      "bottle"
    else
       "bottles"
    end
  end

  def container_reference(number)
    if number == 1
      "it"
    else
      "one"
    end
  end
end
