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
  
end