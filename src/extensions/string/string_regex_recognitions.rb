# Extension on String to give it ability to report on itself regarding regex
# matching, indexing, etc.
class String

  # @param a regular expression
  # @return the original string minus the substring of the first match
  def is_whitespace_or_empty?
    pure_whitespace = self =~ /\A\s*\Z/
    return pure_whitespace
  end
end
