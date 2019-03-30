class Guest

  attr_reader :name, :favourite_song
  attr_accessor :money

  def initialize(name, money, favourite_song)
    @name = name
    @money = money
    @favourite_song = favourite_song
  end

  def pays(amount)
    @money -= amount
  end

  def exclaims(context)
    case context
    when :add_song
      context_string = " (as it is added to the room playlist)"
    when :check_in
      context_string = " (as they check in to the room)"
    else
      context_string = " testing for other conditions!"
    end
    p "#{name} says: Ya dancer! I love #{favourite_song.title}!" + context_string
  end

end