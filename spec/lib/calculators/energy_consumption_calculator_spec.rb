require './lib/calculators/energy_consumption_calculator.rb'

RSpec.describe EnergyConsumptionCalculator do
  describe '#total_energy_consumed' do
    it 'returns 0 when no energy readings are available' do
      energy_readings = []
      expect(described_class.total_energy_consumed(energy_readings)).to eq(0)
    end

    it 'returns 0 when the sum of all energy readings is 0' do
      energy_readings = [
        {"period" => "0:00:00", "usage" => "0"},
        {"period" => "0:30:00", "usage" => "0"}]
      expect(described_class.total_energy_consumed(energy_readings)).to eq(0)
    end

    it 'sums the energy consumed in the periods provided' do
      energy_readings = [
        {"period" => "4:30:00", "usage" => "16.847"},
        {"period" => "5:00:00", "usage" => "16.234"},
        {"period" => "5:30:00", "usage" => "15.407"},
        {"period" => "6:00:00", "usage" => "21.679"}]
      expect(described_class.total_energy_consumed(energy_readings)).to eq(70)
    end
  end
end
