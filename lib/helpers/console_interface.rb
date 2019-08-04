require "./lib/csv_reader.rb"
require "./lib/calculators/energy_generation_calculator.rb"
require "./lib/calculators/energy_consumption_calculator.rb"

class ConsoleInterface
  def initialize(output: $stdout)
    @output = output
  end
  
  def energy_consumption
    consumption_file = './data/02-consumption.csv'

    begin
      @output.puts "Reading #{consumption_file} to calculate energy consumption..."
      energy_readings = CSVReader.parse(CSVReader.read(consumption_file))
      @output.puts "#{EnergyConsumptionCalculator.total_energy_consumed(energy_readings)}Wh of electricity was consumed"

    rescue => e
      @output.puts e.message
    end
  end

  def energy_generation
    generation_file = './data/01-solar_generation.csv'
    @output.puts "Reading #{generation_file} to calculate energy generation..."

    begin
      energy_readings = CSVReader.parse(CSVReader.read(generation_file))
      @output.puts "#{EnergyGenerationCalculator.total_energy_generated(energy_readings)}Wh of electricity was generated"
    
    rescue => e
      @output.puts e.message
    end
  end
end