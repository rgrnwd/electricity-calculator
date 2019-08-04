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

  describe '#read' do
    let(:file_class) { class_double(File).as_stubbed_const }
    let(:content) { 'some content' }
    let(:file_path) { './some-path.csv' }

    it 'calls File.read and returns its contents' do
      allow(file_class).to receive(:read).with(file_path).and_return(content)
      expect(described_class.read(file_path)).to eq(content)
    end

    it 'raises a FileNotFound error when the file does not exist' do
      allow(file_class).to receive(:read).and_raise("No such file")

      expect {
        described_class.read(file_path)
      }.to raise_error(FileNotFoundError)
    end
  end
end
