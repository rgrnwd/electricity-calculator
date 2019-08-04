require 'time'

class IntervalCalculator
  SECONDS_TO_HOURS = 3600
  def self.calculate(energy_readings)
    if energy_readings.length > 1
      first_reading = self.time_reading(energy_readings, 0)
      second_reading = self.time_reading(energy_readings, 1)
      return (second_reading - first_reading) / SECONDS_TO_HOURS
    end
    return 0
  end

  private

    def self.time_reading(energy_readings, index)
      Time.parse(energy_readings[index]['time'])
    end
end
