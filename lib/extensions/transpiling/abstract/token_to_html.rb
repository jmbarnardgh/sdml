require 'require_all'
require_relative 'token_to_plain_text.rb'

# Extends Token to provide support for transpiling to HTML. The constants
# within this extension should be populated in order to make the transpilation
# result meaningful.
class Token

    # @return [String] a plain text rendition of the contents of the token
    def to_html
        token_class = self.class
        metadata_contents = token_class::DEFAULT_META_CONTENTS
        html_tag_term = metadata_contents[:token_subtype]
        html_tag_id_value = @contents[:summary].as_html_tag_id
        plain_text_rendition = "#{to_plain_text}"
        opening_tag = "<#{html_tag_term} id="
        opening_tag += '"'
        opening_tag += html_tag_id_value
        opening_tag += '"'
        opening_tag += '>'
        summary_tag = "<summary>#{@contents[:summary]}</summary> "
        closing_tag = "</#{html_tag_term}>"
        html_string = opening_tag + summary_tag + plain_text_rendition + closing_tag
        return html_string
    end
end