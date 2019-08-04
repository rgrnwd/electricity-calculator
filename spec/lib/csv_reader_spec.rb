require './lib/csv_reader.rb'

RSpec.describe CSVReader do
  describe '#parse' do
    it 'ignores headers' do
      content = "time,power_real"
      expect(described_class.parse(content)).to eq([])
    end

    it 'parses one row of data into the array' do
      content = "time,power_real\n00:00:00,0"
      expect(described_class.parse(content).length).to eq(1)
    end

    it 'parses multiple rows of data into the array' do
      content = "time,power_real\n00:00:00,0\n00:00:05,0"
      expect(described_class.parse(content).length).to eq(2)
    end
  end
end
