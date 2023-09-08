class Amenity
  include ::BracketReadable

  def initialize(name:)
    @name = name
  end

  attr_reader :name

  class Collection
    include Enumerable

    def initialize(collection = [])
      raise ArgumentError, 'collection must be <Enumerable>' unless collection.is_a? Enumerable

      amenities = collection.is_a?(Room::Collection) ? collection.amenities : collection
      @amenities = amenities.map(&BuildAmenity)
    end

    attr_reader :amenities

    BuildAmenity = lambda do |amenity_attrs|
      return amenity_attrs if amenity_attrs.is_a? Room

      amenity_attrs = { name: amenity_attrs } if amenity_attrs.is_a? String

      raise ArgumentError, 'must be a <Hash>' unless amenity_attrs.is_a? Hash

      Amenity.new(**amenity_attrs)
    end

    def last
      @amenities.last
    end

    def <<(amenity)
      amenity => Amenity

      @amenities << amenity
    end

    def each(&block)
      @amenities.each { |member| block.call(member) }
    end
  end
end
