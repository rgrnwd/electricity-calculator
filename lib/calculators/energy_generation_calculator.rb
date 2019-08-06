require './lib/calculators/interval_calculator.rb'
require './lib/models/power_reading.rb'

class EnergyGenerationCalculator

  def self.total_energy_generated(energy_readings)
    interval = IntervalCalculator.calculate(energy_readings)
    sum = 0.0
    energy_readings.each { |reading|
      power_reading = PowerReading.new(reading['power_real'].to_i, interval)
      sum += power_reading.watt_hours
    }
    (sum).to_i
  end

end
