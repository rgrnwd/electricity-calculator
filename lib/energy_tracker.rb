require 'csv'
require './lib/calculators/interval_calculator.rb'
require './lib/models/power_reading.rb'

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
    (sum * 1000).to_i
  end

  def total_energy_consumed
    sum = 0.0
    energy_readings.each { |reading|
      sum += reading['usage'].to_f
    }
    sum.to_i
  end
end
