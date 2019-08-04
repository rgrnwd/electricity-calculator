require 'models/power_reading.rb'

describe 'power_reading' do
  describe '#kilowatt_hours' do
    it 'returns 0 when power is 0' do
      powerReading = PowerReading.new(0, 1)
      expect(powerReading.kilowatt_hours).to eq(0)
    end

    it 'returns 0 when duration is 0' do
      powerReading = PowerReading.new(10, 0)
      expect(powerReading.kilowatt_hours).to eq(0)
    end

    it 'returns power when the period duration is 1 hour' do
      powerReading = PowerReading.new(10, 1)
      expect(powerReading.kilowatt_hours).to eq(0.01)
    end

    it 'returns power multiplied by duration when duration period is 1/4 hour' do
      powerReading = PowerReading.new(100, 0.25)
      expect(powerReading.kilowatt_hours).to eq(0.025)
    end
  end
end
