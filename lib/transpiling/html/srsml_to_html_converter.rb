require_relative '../tokens/business_requirement_token'

class SDMLToHTML
    def self.html_starting_boilerplate
"""<html>
<head>
    <link rel=\"stylesheet\" type=\"text/css\" href=\"style.css\">
</head>
<body>
"""
    end

    def self.html_closing_boilerplate
"""
</body>
</html>"""
    end

    def self.tokenize(string)
        br_token = BusinessRequirementToken.parse(string)
        return br_token
    end

    def self.convert_SDML_file_to_html(input_file_path, output_file_path)
        `rm #{output_file_path}`
        `touch #{output_file_path}`
        File.write("#{output_file_path}", SDMLToHTML::html_starting_boilerplate, File.size("#{output_file_path}"), mode: 'a')
        file = File.open(input_file_path, 'r')
        file.each_line do |line|
            t = SDMLToHTML::tokenize(line)
            writeable_html = ''
            writeable_html = t.as_html unless t == nil
            File.write("#{output_file_path}", writeable_html, File.size("#{output_file_path}"), mode: 'a')
        end
        File.write("#{output_file_path}", SDMLToHTML::html_closing_boilerplate, File.size("#{output_file_path}"), mode: 'a')
    end
end