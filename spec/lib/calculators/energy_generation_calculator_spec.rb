require './lib/calculators/energy_generation_calculator.rb'

RSpec.describe EnergyGenerationCalculator do
  describe '#total_energy_generated' do
    it 'returns 0 when no energy readings are available' do
      energy_readings = []
      expect(described_class.total_energy_generated(energy_readings)).to eq(0)
    end

    it 'returns 0 when the sum of all energy readings is 0' do
      energy_readings = [
        {"time" => "0:00:00", "power_real" => "0"},
        {"time" => "0:05:00", "power_real" => "0"}]
      expect(described_class.total_energy_generated(energy_readings)).to eq(0)
    end

    it 'sums the energy generated in the periods provided' do
      energy_readings = [
        {"time" => "07:40:00", "power_real" => "2765"},
        {"time" => "07:45:00", "power_real" => "3206"},
        {"time" => "07:50:00", "power_real" => "3679"}]
      expect(described_class.total_energy_generated(energy_readings)).to eq(804)
    end
  end
end
