require_relative "../../tokens/super_tokens/token.rb"
require_relative "../../errors/sdml_error.rb"

class SectionRootElementToken < Token
  class Error < SDMLError
    SUMMARY = "Text could not be tokenized to make a technical specification section token object."

    def initialize(custom_message)
      super(custom_message, SUMMARY)
    end
  end
end
