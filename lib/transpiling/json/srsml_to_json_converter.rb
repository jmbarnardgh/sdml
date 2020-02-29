require_relative '../parsers/sdml_parse'
require_relative '../tokens/business_requirement_token'

class SDMLToJSON
    def self.json_starting_boilerplate
        '['
    end

    def self.json_closing_boilerplate
        ']'
    end

    def self.convert_SDML_file_to_json(input_file_path, output_file_path)
        if File.file?(output_file_path)
            `rm #{output_file_path}`
        end
        `touch #{output_file_path}`
        File.write("#{output_file_path}", SDMLToJSON::json_starting_boilerplate, File.size("#{output_file_path}"), mode: 'a')
        file = File.open(input_file_path, 'r')
        line_count = 0
        File.open(input_file_path, 'r').each_line { line_count = line_count + 1 }
        i = 0
        file.each_line do |line|
            t = SDMLParse::parse(line)
            t.metacontents[:token_index] = i
            writeable_json = ''
            writeable_json = t.to_json unless t == nil
            if i == line_count 
                File.write("#{output_file_path}", writeable_json, File.size("#{output_file_path}"), mode: 'a')
            else 
                File.write("#{output_file_path}", writeable_json + ", ", File.size("#{output_file_path}"), mode: 'a')
            end
            i = i + 1
        end
        File.write("#{output_file_path}", SDMLToJSON::json_closing_boilerplate, File.size("#{output_file_path}"), mode: 'a')
    end
end