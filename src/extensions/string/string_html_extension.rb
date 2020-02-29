# Extension on String to give it ability to mutate or return renditions of itself
# with respect to HTML functionality and format
class String
  def as_html_tag_id
    html_tag_id = self.gsub(/\s/, "_")
    html_tag_id = html_tag_id.downcase
    return html_tag_id
  end
end
