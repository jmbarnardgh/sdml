require 'require_all'
require_rel '../extensions/string'
require_rel '../extensions/transpiling'

require_relative 'super_tokens/token.rb'
require_relative '../extensions/error/business_requirement_token_error_extension.rb'

class BusinessRequirementToken < Token
    CONTENT_PATTERNS = {
        :prefix_tag       => '#(BR){1,1}',
        :summary          => '(\([a-zA-Z0-9\s]{1,}\)){1,1}',
        :actor            => '(\[[a-zA-Z0-9\s]{1,}\]){1,1}',
        :action           => '(\[[a-zA-Z0-9\s]{1,}\]){1,1}',
        :results          => '(\[[a-zA-Z0-9\s]{1,}\]){1,1}',
        :newline_optional => '(\n)*'
    }
    IGNORABLE_PATTERN_KEYS = [ :prefix_tag, :newline_optional ]
    DEFAULT_META_CONTENTS  = { :token_index => 0, :token_subtype => 'businessrequirement' }
end