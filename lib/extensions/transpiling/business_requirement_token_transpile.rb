require 'require_all'
require_rel 'abstract'

# Extends the BusinessRequirementToken to be able to serialize to HTML
class BusinessRequirementToken < Token

  # Conforming to informal protocol to allow for transpilation to plain text.
  CLAUSES_FOR_CONTENTS = {
    :actor   => 'As a ',
    :action  => ', I want to be able to ',
    :results => ', in order to '
  }
  CLOSING_SYNTAX = '.'
end