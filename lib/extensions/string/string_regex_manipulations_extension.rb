# Extension on String to give it ability to return values and indices based on
# manipulations using regular expressions.
class String

    # @param a regular expression
    # @return the original string minus the substring of the first match
    def after_removing_first_match(regular_expression)
        first_match = self[regular_expression]
        n = self.length
        m = first_match.length
        substring_after_removing_match = self[m..n]
        return substring_after_removing_match
    end

end