require 'energy_tracker.rb'

describe 'energy_tracker' do
  let(:tracker) { EnergyTracker.new }

  describe '#initialise' do
    it 'sets the array to empty' do
      expect(tracker.energy_readings).to eq([])
    end
  end

  describe '#parse' do
    it 'ignores headers' do
      content = "time,power_real"
      tracker.parse(content)
      expect(tracker.energy_readings).to eq([])
    end

    it 'parses one row of data into the array' do
      content = "time,power_real\n00:00:00,0"
      tracker.parse(content)
      expect(tracker.energy_readings.length).to eq(1)
    end

    it 'parses multiple rows of data into the array' do
      content = "time,power_real\n00:00:00,0\n00:00:05,0"
      tracker.parse(content)
      expect(tracker.energy_readings.length).to eq(2)
    end
  end
end
