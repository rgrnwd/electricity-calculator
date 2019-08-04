require 'csv'
require './lib/models/errors/file_not_found_error.rb'

class CSVReader

  def self.read(path)
    begin
      File.read(path)
    rescue => e
      raise FileNotFoundError
    end
  end

  def self.parse(content)
    energy_readings = []
    content = CSV.parse(content, headers: true) do |data|
      energy_readings << data.to_h
    end
    energy_readings
  end

end
