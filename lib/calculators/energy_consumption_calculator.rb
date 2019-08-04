
class EnergyConsumptionCalculator

  def self.total_energy_consumed(energy_readings)
    sum = 0.0
    energy_readings.each { |reading|
      sum += reading['usage'].to_f
    }
    sum.to_i
  end

end
