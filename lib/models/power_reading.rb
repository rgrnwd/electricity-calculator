class PowerReading
  def initialize(power_kilowatts, period_duration)
    @period_duration = period_duration
    @power_kilowatts = power_kilowatts
  end
  
  def watt_hours
    return (@power_kilowatts * 1000.0 * @period_duration)
  end
end
