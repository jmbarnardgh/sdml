require_relative "super_tokens/token.rb"

class ErrorToken < Token
  def initialize(raw_string_data)
    @metacontents = {
      :token_subtype => "error",
      :token_index => 0,
    }
    @contents = {
      :message => "ERROR: Could not determine what kind of SDML tag this was.",
    }
    super(raw_string_data, @metacontents)
  end

  def self.parse(raw_string_data)
    ErrorToken.new(raw_string_data)
  end
end
