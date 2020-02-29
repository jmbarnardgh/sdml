require 'require_all'
require_rel '../extensions/string'
require_rel '../extensions/transpiling'

require_relative 'super_tokens/token.rb'
require_relative '../extensions/error/business_requirement_token_error_extension.rb'

class BusinessConstraintToken < Token
    CONTENT_PATTERNS = {
        :prefix_tag       => '#(BC){1,1}',
        :summary          => '(\([a-zA-Z0-9\s]{1,}\)){1,1}',
        :object           => '(\[[a-zA-Z0-9\s]{1,}\]){1,1}',
        :clause           => '(\[[a-zA-Z0-9\s]{1,}\]){1,1}',
        :level            => '(\[[0-9]{1,}\]){1,1}',
        :rationale        => '(\[[a-zA-Z0-9\s]{1,}\]){1,1}',
        :newline_optional => '(\n)*'
    }
    IGNORABLE_PATTERN_KEYS = [ :prefix_tag, :newline_optional ]
    DEFAULT_META_CONTENTS  = { :token_index => 0, :token_subtype => 'businessconstraint' }
end