require "test/unit"
require_relative "../../src/parsers/sdml_parse.rb"

class TestTokenizeConnectiveVerbToken < Test::Unit::TestCase
  def setup
    @reference_input = {
      has: "  has",
      shall: "    shall",
      shall_be: "        shall be",
      badinput: "  g",
    }
  end

  def test_tokenize_connective_verb
    begin
      token = ConnectiveVerbToken::parse(@reference_input[:has])
    rescue SDMLError => e
      puts "SDMLError encountered: #{e.summary}, #{e.message}"
    end
    assert_equal ConnectiveVerbToken, token.class
  end

  def test_tokenize_connective_verb_fails_with_bad_input
    begin
      token = ConnectiveVerbToken::parse(@reference_input[:badinput])
    rescue SDMLError => e
      puts "SDMLError encountered: #{e.summary}, #{e.message}"
    end
    assert_equal nil, token
  end
end
