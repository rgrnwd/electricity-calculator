require 'csv'

class CSVReader
  def self.parse(content)
    energy_readings = []
    content = CSV.parse(content, headers: true) do |data|
      energy_readings << data.to_h
    end
    energy_readings
  end

end
