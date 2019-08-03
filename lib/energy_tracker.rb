require 'csv'

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
end
