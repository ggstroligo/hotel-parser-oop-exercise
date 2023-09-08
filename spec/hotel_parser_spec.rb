require File.expand_path('app')

describe HotelParser do
  describe '.parse' do
    subject { HotelParser.parse(File.expand_path('db/seed.yaml')) }

    it 'allows accessing via []' do
      expect(subject['hotels'].last['rooms'].first['amenities'].last.name).to eq 'Pool'
    end

    it 'allows accessing via []' do
      expect(subject['hotels'].first['rooms'].first['amenities'].last.name).to eq 'Fitness'
    end

    it 'allows accessing via method calls' do
      expect(subject.hotels.last.rooms.first.amenities.last.name).to eq 'Pool'
    end

    it 'allows accessing via method calls' do
      expect(subject.hotels.first.rooms.first.amenities.last.name).to eq 'Fitness'
    end
  end
end
