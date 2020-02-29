require "require_all"

require_rel "../extensions/string"
require_rel "../extensions/transpiling"
require_rel "./super_tokens/section_header_token.rb"

require_relative "./../extensions/error/technical_specification_section_token_error_extension.rb"

class TechnicalSpecificationSectionToken < SectionHeaderToken
  CONTENT_PATTERNS = {
    value: '(##\ Technical Specifications|##\ TS){1,1}',
    newline: '\n'
  }
  IGNORABLE_PATTERN_KEYS = [:newline]
  DEFAULT_META_CONTENTS = { :token_index => 0, :token_subtype => "technical-specification-section-header" }
end