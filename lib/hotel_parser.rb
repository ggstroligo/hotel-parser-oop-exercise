require 'yaml'

# Using the [] operator:
# data['hotels'].last['rooms'].first['amenities'].last => "Pool"

# Using method calls:
# data.hotels.last.rooms.first.amenities.last => "Pool"

class HotelParser
  include ::BracketReadable
  # Implement a method to parse the contents of a YAML file and return
  # an object whose values are accessible using the [] operator or method calls
  #
  # Note: Use of the YAML library is fine (encouraged, even) but please don't
  #       use any third-party gems that enable the required functionality.
  def self.parse(filename)
    data = YAML.load_file(filename, symbolize_names: true)

    new(data)
  end

  def initialize(data = {})
    @hotels = data[:hotels].map { |hotel_attrs| ::Hotel.new(**hotel_attrs) }
  end

  attr_reader :hotels
end
