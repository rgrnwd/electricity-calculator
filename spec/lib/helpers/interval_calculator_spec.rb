require 'helpers/interval_calculator.rb'

RSpec.describe IntervalCalculator do
  describe '#calculate' do
    it 'returns 0 when the energy readings are empty' do
      energy_readings = [{"time" => "00:00:00", "power_real" => "0"}]
      expect(described_class.calculate(energy_readings)).to eq(0)
    end
    it 'returns 0 when the only one energy reading is present' do
      energy_readings = [{"time" => "00:00:00", "power_real" => "0"}]
      expect(described_class.calculate(energy_readings)).to eq(0)
    end
    it 'returns difference in hours when two energy readings are available' do
      energy_readings = [
        {"time" => "00:00:00", "power_real" => "0"},
        {"time" => "01:00:00", "power_real" => "0"}
      ]
      expect(described_class.calculate(energy_readings)).to eq(1.0)
    end
    it 'returns difference in hours when two energy readings are minutes apart' do
      energy_readings = [
        {"time" => "00:00:00", "power_real" => "0"},
        {"time" => "00:06:00", "power_real" => "0"}
      ]
      expect(described_class.calculate(energy_readings)).to eq(0.1)
    end
  end
end
