class FileNotFoundError < StandardError
  def initialize
    super("I can't seem to find that file.")
  end
end