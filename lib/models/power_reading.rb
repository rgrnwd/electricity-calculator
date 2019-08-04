class PowerReading
  def initialize(power, period_duration)
    @period_duration = period_duration
    @power = power
  end
  
  def kilowatt_hours
    return (@power * @period_duration) / 1000.0
  end
end
