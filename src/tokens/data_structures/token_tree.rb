class TokenTree 

  attr_reader :root, :leaves, :terminal_leaves

  # Initializes a TokenTree from an array. The array is expected to be ordered
  # according to a valid first-stage deserialization (i.e. line-by-line
  # conversion of lines to tokens.)
  # @param [Array<Token>] token_array an array of Token objects
  def initialize(token_array)
    current_depth = 0
    parent_token = nil
    token = next_from(token_array)
    if token.depth_index.accords_with(current_depth)
      @root = if parent_token == nil
                token
              else 
                TokenTree::insert(token, current_depth, parent_token)
              end
    end
  end

end