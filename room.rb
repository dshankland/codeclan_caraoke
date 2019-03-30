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
    if @guestlist.count() < @capacity && guest.money >= @entry_fee
      guest.pays(@entry_fee)
      @guestlist << guest
      @till += @entry_fee
      if @songlist.include?(guest.favourite_song)
        guest.exclaims(:check_in)
      end
    end
  end

  def check_out(guest)
    @guestlist.delete(guest)
  end

  def add_song(song)
    @songlist.push(song)
    for guest in @guestlist
      if guest.favourite_song == song
        guest.exclaims(:add_song)
      end
    end
  end

end