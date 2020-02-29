require_relative "string_index_extension"

# An extension that helps with grammar.
class String
  @@words_starting_with_vowels_preceded_by_a = [
    "user",
  ]

  def starts_with_vowel
    return true unless first_character[/[aeiou]/] == nil
    false
  end

  def suggested_artical_to_precede
    @@words_starting_with_vowels_preceded_by_a.each do |w|
      return "a" if self.downcase == w.downcase
    end
    return "an" if self.starts_with_vowel
    return "a"
  end
end
