require "test/unit"

require_relative "../../src/parsers/sdml_parse.rb"

class TestConnectiveVerbTokenRelatableness < Test::Unit::TestCase
  def setup
    @serialized_connective_token = "  has" #2-spaces indentation
    @serialized_descriptor_token = "    - a box" #4-spaces indentation
  end

  def test_tokenize_connective_verb_can_parent_descriptor
    begin
      connective_token = ConnectiveVerbToken::parse(@serialized_connective_token)
      descriptor_token = ContentItemDescriptorToken::parse(@serialized_descriptor_token)
      assert_not_equal nil, connective_token
      assert_not_equal nil, descriptor_token
      assert_equal true, connective_token.can_connectively_parent?(descriptor_token)
    rescue SDMLError => e
      puts "SDMLError encountered: #{e.summary}, #{e.message}"
    end
  end
end
