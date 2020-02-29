require 'json'

# Markdown Extension on Token
class Token
   
    def to_markdown
        token_class = self.class
        metadata_contents = token_class::DEFAULT_META_CONTENTS
        html_tag_term = metadata_contents[:token_subtype]
        markdown_title = """# #{@contents[:summary]}

"""
        markdown_text = to_plain_text
        markdown_string = markdown_title + markdown_text
        return markdown_string
    end
end