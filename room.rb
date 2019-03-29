class Room

  attr_reader :name, :capacity, :entry_fee
  attr_accessor :songlist, :guestlist, :till

  def initialize(name, songlist, entry_fee)
    @name = name
    @songlist = songlist
    @entry_fee = entry_fee
    @capacity = 5
    @guestlist = []
    @till = 0
  end

  def check_in(guest)
    guest.pays(@entry_fee)
    @guestlist << guest
    @till += @entry_fee
  end

  def check_out(guest)
    @guestlist.delete(guest)
  end

end