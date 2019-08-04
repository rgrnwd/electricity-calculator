require 'csv'
require 'helpers/interval_calculator'
require 'models/power_reading'

class EnergyTracker
  attr_accessor :energy_readings
  def initialize()
    self.energy_readings = []
  end
  
  def parse(content)
    content = CSV.parse(content, headers: true) do |data|
      energy_readings << data.to_h
    end
  end

  def total_energy_generated
    interval = IntervalCalculator.calculate(energy_readings)
    sum = 0.0
    energy_readings.each { |reading|
      power_reading = PowerReading.new(reading['power_real'].to_i, interval)
      sum += power_reading.kilowatt_hours
    }
    sum
  end
end
