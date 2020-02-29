require "require_all"
require_rel "../../extensions/string"
require_rel "../../extensions/transpiling"

class SectionHeaderToken < Token
  CONTENT_PATTERNS = {
    :prefix_tag => '## ',
    :newline_optional => '(\n)',
  }
  IGNORABLE_PATTERN_KEYS = [:prefix_tag, :newline_optional]
  DEFAULT_META_CONTENTS = { :token_index => 0, :token_subtype => "sectionheadertoken" }
end