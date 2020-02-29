require_relative "../../tokens/super_tokens/token.rb"
require_relative "../../errors/sdml_error.rb"

# Extension on BusinessConstraintToken to Implement Error Handling
class BusinessConstraintToken < Token
  class Error < SDMLError
    SUMMARY = "Text could not be tokenized to make a business constraint token object."

    def initialize(custom_message)
      super(SUMMARY, custom_message)
    end
  end
end
