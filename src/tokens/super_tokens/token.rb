require_relative '../modules/token_relation.rb'

# Base class for token objects generated during SDML parsing.
# Intended to be a super class only.
class Token
  include TokenRelation  
  public

  # A hash of strings which, collectively, form the regular expression
  # pattern needed to transform a string into a token.
  CONTENT_PATTERNS = {
    :prefix_tag => "",
    :removable_sequences => "",
  }

  # An array of patterns which can be recognized but for which the
  # contents encapsulated within the pattern does not transpile to content.
  IGNORABLE_PATTERN_KEYS = []

  DEFAULT_META_CONTENTS = {
    :relatableness => [:leaf], 
    :token_subtype => "undefined" 
  }

  attr_accessor :raw_string, :contents, :metacontents

  def initialize(parsed_string = "", contents_from_parsed_string = {}, meta_contents = DEFAULT_META_CONTENTS )
    # The raw string value that was parsed to form the token
    @raw_string = parsed_string
    # A hash of contents of the parsed token
    @contents = contents_from_parsed_string
    # Valid relatableness symboles are
    #
    #   - `:childless_leaf`
    #   - `:leaf_of_connective_parent`
    #   - `:parent_of_connective_child`
    #
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
    matchable_regex = full_regex
    match = string[matchable_regex]
    token_type_string = self::DEFAULT_META_CONTENTS[:token_subtype]
    unless match == string then raise self::Error.new("#{token_type_string} tokenization regex non-match for provided string: #{string}") end

    working_string = match

    new_tkn_cntnt = {}
    self::CONTENT_PATTERNS.each do |key, pattern|
      regex = /#{pattern}/
      matched_region = working_string[regex]
      value = matched_region
      new_tkn_cntnt[key] = value unless included_in_ignorable_pattern_keys?(key)
      working_string = working_string.after_removing_first_match(regex)
    end

    meta_contents = self::DEFAULT_META_CONTENTS

    tkn = self.new(string, new_tkn_cntnt, meta_contents)
    return tkn
  end

  # @return regex based on in-order key-value store in @@content_patterns
  def self.full_regex
    pattern_string = ""
    self::CONTENT_PATTERNS.each do |key, pat|
      pattern_string = pattern_string + pat
    end
    regex = /#{pattern_string}/
    return regex
  end
end
