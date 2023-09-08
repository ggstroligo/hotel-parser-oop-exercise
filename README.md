Hotel Parser
------------

With the provided YAML file in `data/hotel.yaml`, implement the hotel parser in a way that parses the file and returns a collection of nested objects
representing the data. You may use the standard YAML parser, but do not use OpenStruct. Bonus points for good OOP representation.

The object should respond to the following requirements:

1. Using the `[]` operator:
  ```
  data['hotels'].last['rooms'].first['amenities'].last => "Pool"
  ```

1. Using method calls:
  ```
  data.hotels.last.rooms.first.amenities.last => "Pool"
  ```

Tests have been pre-written using rspec in `/spec/hotel_parser_spec.rb`. There is a parse method in the HotelParser class located in
`code/hotel_parser.rb`.