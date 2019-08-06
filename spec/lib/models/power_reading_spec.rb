require './lib/models/power_reading.rb'

describe 'power_reading' do
  describe '#watt_hours' do
    it 'returns 0 when power is 0' do
      powerReading = PowerReading.new(0, 1)
      expect(powerReading.watt_hours).to eq(0)
    end

    it 'returns 0 when duration is 0' do
      powerReading = PowerReading.new(10, 0)
      expect(powerReading.watt_hours).to eq(0)
    end

    it 'returns power in watts (x1000) when the period duration is 1 hour' do
      powerReading = PowerReading.new(10, 1)
      expect(powerReading.watt_hours).to eq(10000)
    end

    it 'returns power in watts (x1000) multiplied by duration when duration period is 1/4 hour' do
      powerReading = PowerReading.new(100, 0.25)
      expect(powerReading.watt_hours).to eq(25000)
    end
  end
end
