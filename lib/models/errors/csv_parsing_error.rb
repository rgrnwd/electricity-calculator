class CSVParsingError < StandardError
  def initialize
    super("I am having some trouble reading this file.")
  end
end