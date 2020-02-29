require "test/unit"
require_relative "../../src/parsers/sdml_parse.rb"

class TestTokenizeSectionRootElementToken < Test::Unit::TestCase
  def setup
    @reference_input = """save button
"""
    @bad_input = '- 92492'
  end

  def test_tokenize_section_root_element
    begin
      token = SectionRootElementToken::parse(@reference_input)
    rescue SDMLError => e
      puts "SDMLError encountered: #{e.summary}, #{e.message}"
    end
    assert_equal SectionRootElementToken, token.class
  end

  def test_tokenize_section_root_element_raises_with_bad_input
    begin
      token = SectionRootElementToken::parse(@bad_input)
    rescue SDMLError => e
      puts "SDMLError encountered: #{e.summary}, #{e.message}"
    end
    assert_equal nil, token
  end
end