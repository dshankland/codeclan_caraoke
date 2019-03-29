class Room

  attr_reader :name, :capacity, :entry_fee
  attr_accessor :songlist, :guestlist

  def initialize(name, songlist, entry_fee)
    @name = name
    @songlist = songlist
    @entry_fee = entry_fee
    @capacity = 5
    @guestlist = []
  end

end