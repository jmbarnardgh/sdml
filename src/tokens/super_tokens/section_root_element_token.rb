require "require_all"
require_rel "../../extensions/string"
require_rel "../../extensions/transpiling"

require_relative "./../../extensions/error/section_root_element_token_error_extension.rb"

class SectionRootElementToken < Token
  CONTENT_PATTERNS = {
    :element_content => '^([a-zA-Z0-9])+([a-zA-Z0-9]|\ )*',
    :newline => '(\n)*'
  }
  IGNORABLE_PATTERN_KEYS = []
  DEFAULT_META_CONTENTS = { :token_index => 0, :token_subtype => "section-root-element-token" }
end