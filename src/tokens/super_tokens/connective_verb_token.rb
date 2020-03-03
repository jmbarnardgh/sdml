require "require_all"

require_rel "../../extensions/string"
require_rel "../../extensions/transpiling"

require_relative "./../../extensions/error/connective_verb_token_error_extension.rb"


class ConnectiveVerbToken < Token

  DEFAULT_RELATABLENESS = {
    leafable: false,
    expects_connective_verb_parent: false,
    connective_verb: true,
    indentation_depth: 2
  }

  CONTENT_PATTERNS = {
    :element_content => '^(\s\s)+(is|want|has|should|defined|shall\sbe|shall|shall\snot|when\,\sshall){1,1}$',
    :newline_optional => '(\n)*',
  }
  IGNORABLE_PATTERN_KEYS = [:newline_optional]
  DEFAULT_META_CONTENTS = { :token_index => 0, :token_subtype => "connectiveverbtoken" }

  def initialize(parsed_string, contents_from_parsed_string, meta_contents, indentation_depth = 2)
    super(parsed_string, contents_from_parsed_string, meta_contents)
    @relatableness = DEFAULT_RELATABLENESS
    @relatableness[:indentation_depth] = indentation_depth
  end

end