require "json"

# Markdown Extension on Token
class Token
  def to_markdown
    markdown_title = "" "# #{@contents[:summary]}

" ""
    markdown_text = to_plain_text
    markdown_string = markdown_title + markdown_text
    return markdown_string
  end
end
