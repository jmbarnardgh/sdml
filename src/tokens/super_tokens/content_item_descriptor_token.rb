require "require_all"

require_rel "../../extensions/string"
require_rel "../../extensions/transpiling"

require_relative "./../../extensions/error/content_item_descriptor_token_error_extension.rb"


class ContentItemDescriptorToken < Token
  DEFAULT_RELATABLENESS = {
    leafable: true,
    expects_connective_verb_parent: true,
    connective_verb: false,
    indentation_depth: 4
  }
  CONTENT_PATTERNS = {
    :element_content => '^(\ {4,4})+\-\ (\w|\-|\#|\"|\.|\,)+(\w|\ |\-|\#|\"|\.|\,)*',
    :newline => '(\n)*',
  }
  IGNORABLE_PATTERN_KEYS = [:newline]
  DEFAULT_META_CONTENTS = { :token_index => 0, :token_subtype => "connectiveverbtoken" }

  def initialize(parsed_string, contents_from_parsed_string, meta_contents, indentation_depth = 4)
    super(parsed_string, contents_from_parsed_string, meta_contents)
    @relatableness = DEFAULT_RELATABLENESS
    @relatableness[:indentation_depth] = indentation_depth
  end
end