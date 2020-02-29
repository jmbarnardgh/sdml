require "require_all"
require_rel "../extensions/string"
require_rel "../tokens"

# A basic parser that helps convert SDML string into object tokens.
class SDMLParse
  TOKEN_TYPES = [
    TechnicalSpecificationSectionToken,
    SectionRootElementToken,
    ConnectiveVerbToken,
    VerbTargetToken,
    ContentItemDescriptorToken
  ]

  # @return token SDML element corresponding to provided SDML string
  def self.parse(sdml_string)
    return nil if sdml_string.is_whitespace_or_empty?
    TOKEN_TYPES.each do |token_type|
      begin
        token = token_type.parse(sdml_string)
        return token unless token.class == token_type::Error
      rescue token_type::Error
        next
      end
    end
    return nil
  end

  # @param sdml [String] multi-line string of sdml
  # @return [Array<Token>] tokens from multiple lines of sdml as one string
  def self.parse_lines(sdml)
    tokens = []
    sdml.each_line do |line|
      unless line.is_whitespace_or_empty?
        t = parse(line)
        tokens << t unless t == nil
      else
        next
      end
    end
    tokens
  end

  # This method passes a file line-by-line to the `parse` method, which in turn
  # takes the line as a potential serialized token to deserialize it.
  #
  # @note this method may be inefficient for sufficiently large SDML, since
  #   it converts all file data into objects stored in memory
  # @return [Array<Token>] an array of tokens from the
  def self.parse_file(input_file_path)
    tokens = []
    file = File.open(input_file_path, "r")
    file.each_line do |line|
      unless line.is_whitespace_or_empty?
        t = parse(line)
        tokens << t unless t == nil
      else
        next
      end
    end
    tokens
  end
end
