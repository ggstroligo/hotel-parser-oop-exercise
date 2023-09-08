class Hotel
  include ::BracketReadable

  def initialize(name:, rooms: Room::Collection.new)
    @name = name
    @rooms = Room::Collection.new(rooms)
  end

  attr_reader :rooms
end
