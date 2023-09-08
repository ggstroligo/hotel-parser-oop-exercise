class Room
  include ::BracketReadable

  def initialize(name:, amenities: Amenity::Collection.new)
    @name = name
    @amenities = Amenity::Collection.new(amenities)
  end

  attr_reader :name, :amenities

  class Collection
    include Enumerable

    def initialize(collection = [])
      raise ArgumentError, 'collection must be <Enumerable>' unless collection.is_a? Enumerable

      rooms = collection.is_a?(Room::Collection) ? collection.rooms : collection
      @rooms = rooms.map(&BuildRoom)
    end

    attr_reader :rooms

    BuildRoom = lambda do |room_attrs|
      return room_attrs if room_attrs.is_a? Room

      raise ArgumentError, 'must be a <Hash>' unless room_attrs.is_a? Hash

      Room.new(**room_attrs)
    end

    def last
      @rooms.last
    end

    def each(&block)
      @rooms.each { |member| block.call(member) }
    end

    def <<(room)
      room => Room

      @rooms << room
    end
  end
end
