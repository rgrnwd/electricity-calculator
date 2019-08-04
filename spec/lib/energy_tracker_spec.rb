require './lib/energy_tracker.rb'

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

  describe '#total_energy_generated' do
    it 'returns 0 when no energy readings are available' do
      expect(tracker.total_energy_generated).to eq(0)
    end

    it 'returns 0 when the sum of all energy readings is 0' do
      content = "time,power_real\n00:00:00,0\n00:00:05,0"
      tracker.parse(content)
      expect(tracker.total_energy_generated).to eq(0)
    end

    it 'returns sum in watt hours for multiple energy readings' do
      content = "time,power_real\n07:40:00,2765\n07:45:00,3206\n07:50:00,3679"
      tracker.parse(content)
      expect(tracker.total_energy_generated).to eq(804)
    end
  end
end
