require "./lib/helpers/console_interface.rb"

puts 'Welcome to the Electricity Calculator!'
puts '======================================'
console_interface = ConsoleInterface.new()

console_interface.energy_generation
console_interface.energy_consumption