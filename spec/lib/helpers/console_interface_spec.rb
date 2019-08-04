require 'helpers/console_interface.rb'

describe 'console interface' do

  let(:output) { StringIO.new }
  let(:file_class) { class_double(File).as_stubbed_const }
  let(:dummy_content) { '' }

  describe '#energy_generation' do
    let(:console_interface) { ConsoleInterface.new(output: output) }
    let(:calculator) { class_double(EnergyGenerationCalculator).as_stubbed_const }

    it 'reads the file ./data/01-solar_generation.csv' do
      expect(file_class).to receive(:read).with('./data/01-solar_generation.csv').and_return(dummy_content)
      console_interface.energy_generation
    end

    it 'prints the name of the file read' do
      console_interface.energy_generation
      expect(output.string).to include("Reading ./data/01-solar_generation.csv to calculate energy generation...")
    end

    it 'prints a nice error if for some reason the file cannot be read' do
      allow(file_class).to receive(:read).with('./data/01-solar_generation.csv').and_raise('No such file')
      console_interface.energy_generation
      expect(output.string).to include("I can't seem to find that file.")
    end

    it 'prints the total returned from the energy generation calculator' do
      expect(calculator).to receive(:total_energy_generated).and_return(12345)
      console_interface.energy_generation
      expect(output.string).to include("12345Wh of electricity was generated")
    end
  end

  describe '#energy_consumption' do
    let(:input) { StringIO.new("\n\n") }
    let(:console_interface) { ConsoleInterface.new(output: output) }
    let(:calculator) { class_double(EnergyConsumptionCalculator).as_stubbed_const }

    it 'reads the file ./data/02-consumption.csv' do
      expect(file_class).to receive(:read).with('./data/02-consumption.csv').and_return(dummy_content)
      console_interface.energy_consumption
    end

    it 'prints the name of the file read' do
      console_interface.energy_consumption
      expect(output.string).to include("Reading ./data/02-consumption.csv to calculate energy consumption...")
    end

    it 'prints a nice error if for some reason the file cannot be read' do
      allow(file_class).to receive(:read).with('./data/02-consumption.csv').and_raise('No such file')
      console_interface.energy_generation
      expect(output.string).to include("I can't seem to find that file.")
    end

    it 'prints the total returned from the energy consumption calculator' do
      expect(calculator).to receive(:total_energy_consumed).and_return(300)
      console_interface.energy_consumption
      expect(output.string).to include("300Wh of electricity was consumed")
    end
  end

end
