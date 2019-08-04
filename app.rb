require "./lib/csv_reader.rb"
require "./lib/calculators/energy_generation_calculator.rb"
require "./lib/calculators/energy_consumption_calculator.rb"

puts 'Welcome to the Electricity Calculator!'
puts '======================================'

puts 'Reading ./data/01-solar_generation.csv to calculate energy generation...'
energy_readings = CSVReader.parse(File.read('./data/01-solar_generation.csv'))
puts "#{EnergyGenerationCalculator.total_energy_generated(energy_readings)}Wh of electricity was generated"

puts 'Reading ./data/02-consumption.csv to calculate energy generation...'
energy_readings = CSVReader.parse(File.read('./data/02-consumption.csv'))
puts "#{EnergyConsumptionCalculator.total_energy_consumed(energy_readings)}Wh of electricity was consumed"