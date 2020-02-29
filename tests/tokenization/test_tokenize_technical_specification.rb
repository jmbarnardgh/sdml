require "test/unit"
require_relative "tokenization_test_data.rb"

require_relative "../../src/parsers/sdml_parse.rb"

class TestTokenizeTechnicalSpecification < Test::Unit::TestCase
  def test_tokenize_tech_spec_header
    input_string = """## Technical Specifications
"""
    begin
      token = TechnicalSpecificationSectionToken::parse(input_string)
    rescue SDMLError => e
      puts "SDMLError encountered: #{e.summary}, #{e.message}"
    end
    assert_equal TechnicalSpecificationSectionToken, token.class
  end

  def test_tokenize_tech_spec_file
    dir_name = File.dirname(__FILE__)
    sdml_file_path = "#{dir_name}/../../examples/hello-tech-specs.sdml"
    tokens = SDMLParse::parse_file(sdml_file_path)
    tokens.each do |t|
      puts "#{t.class} : #{t.contents[:element_content]}"
    end
    assert_equal 36, tokens.length
    assert_equal TechnicalSpecificationSectionToken, tokens[0].class
    assert_equal '## Technical Specifications', tokens[0].contents[:value]
  end
end