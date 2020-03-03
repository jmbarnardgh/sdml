require "require_all"
require_rel "../../extensions/string"
require_rel "../../extensions/transpiling"

class SectionHeaderToken < Token

  DEFAULT_RELATABLENESS = {
    leafable: false,
    expects_connective_verb_parent: false,
    connective_verb: false,
    indentation_depth: 0
  }

  CONTENT_PATTERNS = {
    :prefix_tag => '## ',
    :newline_optional => '(\n)',
  }
  IGNORABLE_PATTERN_KEYS = [:prefix_tag, :newline_optional]
  DEFAULT_META_CONTENTS = { :token_index => 0, :token_subtype => "sectionheadertoken" }
end