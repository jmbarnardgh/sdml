# Base class for token objects generated during SDML parsing.
# Intended to be a super class only.
class Token

    public

    # A hash of strings which, collectively, form the regular expression
    # pattern needed to transform a string into a token.
    CONTENT_PATTERNS = {
        :prefix_tag => '',
        :newline_optional => '(\n)*'
    }

    # An array of patterns which can be recognized but for which the
    # contents encapsulated within the pattern does not transpile to content.
    IGNORABLE_PATTERN_KEYS = []

    DEFAULT_META_CONTENTS = { :token_index => 0, :token_subtype => 'undefined'}

    # The raw string value that was parsed to form the token
    attr_accessor :raw_string
    @raw_string

    # A hash of contents of the parsed token
    attr_accessor :contents
    @contents

    # A hash of metacontents of the parsed token, such as token sub-type,
    # any kind of uniquing key for the token, an index for the token as
    # it may be listed amongst other tokens of a similar sub-type, etc.
    attr_accessor :metacontents
    @metacontents

    def initialize(parsed_string = '', contents_from_parsed_string = {}, meta_contents = { :token_subtype => '', :token_index => 0 })
        @raw_string   = parsed_string
        @contents     = contents_from_parsed_string
        @metacontents = meta_contents
    end

    def self.occurrences
    end

    # @param pattern_key [Symbol]
    # @return true if provided symbol is in @@ignorable_pattern_keys 
    def self.included_in_ignorable_pattern_keys?(pattern_key)
        self::IGNORABLE_PATTERN_KEYS.include?(pattern_key)
    end

    # @return a token based on the provided string
    def self.parse(string)
        match = string[full_regex]
        token_type_string = self::DEFAULT_META_CONTENTS[:token_subtype]
        unless match == string then raise self::Error.new("#{token_type_string} tokenization regex non-match for provided string: #{string}") end

        working_string = match

        new_tkn_cntnt = {}
        self::CONTENT_PATTERNS.each do |key, pattern|
            regex = /#{pattern}/
            matched_region = working_string[regex] 
            value = matched_region.trim_edges_by(1)
            new_tkn_cntnt[key] = value unless included_in_ignorable_pattern_keys?(key)
            working_string = working_string.after_removing_first_match(regex)            
        end

        meta_contents = self::DEFAULT_META_CONTENTS

        tkn = self.new(string, new_tkn_cntnt, meta_contents)
        return tkn
    end

    # @return regex based on in-order key-value store in @@content_patterns
    def self.full_regex
        pattern_string = ''
        self::CONTENT_PATTERNS.each do |key, pat|
            pattern_string = pattern_string + pat
        end
        regex = /#{pattern_string}/
        return regex
    end
end