class PowerReading
  def initialize(power, period_duration)
    @period_duration = period_duration
    @power = power
  end
  
  def watts_per_hour
    return @power * @period_duration
  end
end
