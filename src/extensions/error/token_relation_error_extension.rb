module TokenRelation
  # The `Token` `@relatableness` hash keys that will need to
  # be valid are: 
  #
  #   - :leafable
  #   - :previously_stacked_types_dependent
  #   - :section_type
  #   - :conditional_clause_member
  #   - :indentation_depth
  #   - :is_connective
  # 
  # If these are missing, an error should be raised.
  class Error
    def initialize(summary, message)
        @summary = summary
        @message = message
    end
    NOT_LEAFABLE_EXCEPTION = TokenRelation::Error.new(
        "Improper Relatable Value",
        "The token does not have a valid Boolean value for :leafable on property @relatableness."
    )
    TOKEN_TYPE_STACK_DEPENDENCE_UNKNOWN = TokenRelation::Error.new(
        "Token Type Stack Dependence Unknown", 
        "The token does not have a valid Boolean value for :previously_stacked_types_dependent on property @relatableness."
    )
    SECTION_TYPE_MISSING_EXCEPTION = TokenRelation::Error.new(
        "Document Section Type Missing for Token",
        "The token does not have a valid document section type for :section_type on property @relatableness."
    )
    UNKNOWN_CONDITIONAL_CLAUSE_MEMBERSHIP = TokenRelation::Error.new(
        "No Indication about being a Conditional Clause Memeber Exists for Token",
        "The token does not have a valid Boolean value for :conditional_clause_member on property @relatableness."
    )
    INVALID_OR_MISSING_INDENTATION_DEPTH = TokenRelation::Error.new(
        "Invalid/Missing Indentation Depth for Token",
        "The token does not have a valid Boolean value for the :indentation_depth member on property @relatableness."
    )
    INVALID_OR_MISSING_CONNECTIVE_INDICATION = TokenRelation::Error.new(
        "Missing Indication about whether Token is a Connective",
        "The token does not have a valid Boolean value for :is_connective member on the property @relatableness."
    )
  end
end