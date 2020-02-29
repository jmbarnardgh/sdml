# Basic SDML error type
class SDMLError < StandardError
  attr_reader :summary, :message

  def initialize(summary, message)
    @summary = summary
    @message = message
  end
end
