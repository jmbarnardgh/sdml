require 'require_all'
require_rel '../extensions/string'

require_relative 'super_tokens/token.rb'
require_relative '../extensions/error/technical_specification_token_error_extension.rb'

class TechnicalSpecificationToken < Token
    CONTENT_PATTERNS = {
        :prefix_tag       => '#(TS){1,1}',
        :summary          => '(\([a-zA-Z0-9\s]{1,}\)){1,1}',
        :subject          => '(\[[a-zA-Z0-9\s]{1,}\]){1,1}',
        :imperative       => '(\[(shall|shall not)\]){1,1}',
        :clause           => '(\[[a-zA-Z0-9\s]{1,}\]){1,1}',
        :newline_optional => '(\n)*'
    }
    IGNORABLE_PATTERN_KEYS = [ :prefix_tag, :newline_optional ]
    DEFAULT_META_CONTENTS  = { :token_index => 0, :token_subtype => 'technicalspecification' }
end