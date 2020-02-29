# Extension on String to give it ability to find indexes, give first, last chars,
# and other basic index related features.
class String

    def start_index
        return 0
    end

    def end_index
        length = self.length
        length - 1
    end

    def first_character
        self[0..0]
    end

    def last_character
        self[end_index..end_index]
    end

    def first_character_dropped
        new_start_index = start_index + 1
        self[new_start_index..end_index]
    end

    def last_character_dropped
        new_end_index = end_index - 1
        self[start_index..new_end_index]
    end

    # @param x [Integer] the number of characters to trim
    # @return a new string with the first x characters and last x characters dropped
    def trim_edges_by(x)
        trimmed = self
        i = x
        while i > 0 && trimmed.length > 0
            trimmed = trimmed.first_character_dropped
            return '' if trimmed.length == 0
            trimmed = trimmed.last_character_dropped
            i = i - 1
        end
        trimmed
    end
end