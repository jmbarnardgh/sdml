# Extends Token to provide support for transpiling to plain text. The constants
# within this extension should be populated in order to make the transpilation
# result meaningful.
class Token
  CLAUSES_FOR_CONTENTS = {}
  CLOSING_SYNTAX = ""

  # Basic method to convert to plain text.
  # Override this method in an extension for different functionality.
  #
  # @return [String] a plain text rendition of the contents of the token
  def to_plain_text
    token_class = self.class
    plain_text_string = ""
    @contents.each do |content_key, content_value|
      if token_class::IGNORABLE_PATTERN_KEYS.include?(content_key) == false
        clause_verbiage = token_class::CLAUSES_FOR_CONTENTS[content_key]
        next if clause_verbiage == nil
        plain_text_string += clause_verbiage + content_value
      end
    end
    plain_text_string += token_class::CLOSING_SYNTAX
    return plain_text_string
  end
end
