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
                TokenTree::insert(token, parent_token)
              end
    end
  end

  # Inserts a token into the tree.
  #
  # Algorithm: 
  #
  # A token is provided for insertion. The token is
  # compared with its parent token. If the parent token
  # can directly relate to the provided token, then
  # the token is inserted as a child of the parent token.
  # Otherwise, a recursive search for a suitable ancestor
  # token begins. If no suitable ancestor exists, the
  # insertion is rejected and an error raised. 
  #
  # @param token [Token] the Token object to be inserted
  def self.insert(token, parent_token)
    
  end

end