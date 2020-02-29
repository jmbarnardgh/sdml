require_relative "../../tokens/data_structures/token_tree.rb"
require_relative "../../errors/sdml_error.rb"

# Extension on TechnicalSpecificationToken to Implement Error Handling
class TokenTree
  class Error < SDMLError
    NO_SUITABLE_ANCESTOR_FOR_TOKEN = 'No suitable ancestor exists with which to relate the provided token.'

    def initialize(custom_message)
      super(custom_message, SUMMARY)
    end
  end
end
