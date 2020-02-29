require_relative "../../tokens/super_tokens/token.rb"
require_relative "../../errors/sdml_error.rb"

# Extension on BusinessRequirementToken to Implement Error Handling
class BusinessRequirementToken < Token
  class Error < SDMLError
    SUMMARY = "Text could not be tokenized to make a business requirement token object."

    def initialize(custom_message)
      super(SUMMARY, custom_message)
    end
  end
end
