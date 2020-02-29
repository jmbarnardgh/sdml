require "require_all"
require_rel "../../extensions/string"
require_rel "../../extensions/transpiling"

require_relative "./../../extensions/error/verb_target_token_error_extension.rb"

class VerbTargetToken < Token
  CONTENT_PATTERNS = {
    :element_content => '^(\ {4,4})+\w+(\w|\ |\-|\#|\"|\.|\,)*',
    :newline => '\n'
  }
  IGNORABLE_PATTERN_KEYS = []
  DEFAULT_META_CONTENTS = { :token_index => 0, :token_subtype => "section-root-element-token" }
end