require "require_all"

require_rel "../../extensions/string"
require_rel "../../extensions/transpiling"

require_relative "./../../extensions/error/connective_verb_token_error_extension.rb"


class ConnectiveVerbToken < Token
  CONTENT_PATTERNS = {
    :element_content => '^(\s\s)+(is|want|has|should|defined|shall\sbe|shall|shall\snot|when\,\sshall){1,1}$',
    :newline_optional => '(\n)*',
  }
  IGNORABLE_PATTERN_KEYS = [:newline_optional]
  DEFAULT_META_CONTENTS = { :token_index => 0, :token_subtype => "connectiveverbtoken" }
end