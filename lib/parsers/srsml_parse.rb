require 'require_all'
require_rel '../extensions/string'
require_rel '../tokens'

# A basic parser that helps convert SDML string into object tokens.
class SDMLParse

    TOKEN_TYPES = [
        BusinessRequirementToken,
        TechnicalSpecificationToken,
    ]

    # @return token SDML element corresponding to provided SDML string
    def self.parse(SDML_string)
        TOKEN_TYPES.each do |token_type|
            begin
                token = token_type.parse(SDML_string)
                return token unless token.class == token_type::Error
            rescue token_type::Error
                next
            end
        end
        return nil
    end

    # @param SDML [String] multi-line string of SDML
    # @return tokens from multiple lines of SDML as one string
    def self.parse_lines(SDML)
        tokens = []
        SDML.each_line do |line|
            unless line.is_whitespace_or_empty? 
                t = parse(line)
                tokens << t unless t == nil
            else
                next
            end
        end
        tokens
    end

    # @note this method may be inefficient for sufficiently large SDML, since
    #   it converts all file data into objects stored in memory
    # @return an array of tokens from the 
    def self.parse_file(SDML_file_path)
        tokens = []
        file = File.open(input_file_path, 'r')
        file.each_line do |line|
            unless line.is_whitespace_or_empty? 
                t = parse(line)
                tokens << t
            else
                next
            end
        end
        tokens
    end

end