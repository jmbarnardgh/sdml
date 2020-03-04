require 'require_all'
require_rel '../tokens'

class TokenTree

  NON_TOKEN_INSERTION_ERROR = "A non-token was attempted to be inserted."

  attr_accessor :root_token, :_token_type_stack, :_most_recent_inserted_token

  # Initializes a TokenTree from an array. The array is expected to be ordered
  # according to a valid first-stage deserialization (i.e. line-by-line
  # conversion of lines to tokens.)
  def initialize(root_token = nil)
    @root_token = root_token
    @_most_recent_inserted_token = root_token
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
  def insert(token)
    raise NON_TOKEN_INSERTION_ERROR unless token.is_a? Token
    if @root_token == nil
      @root_token = token; return
    else
      parent = next_parent_for(token)
      parent.child_tokens << token
      @_token_type_stack << token.class
      @_most_recent_inserted_token = token
    end
  end

  # @return [Token] a valid Token which can act as a parent for insertable_token
  def next_parent_for(current_parent, insertable_token)
    # evaluate the current types on the stack
    # if the most recently inserted token can be the parent, so be it
    # otherwise, search for a valid parent
    current_parent = @_most_recent_inserted_token if current_parent == nil
    if current_parent.can_parent?(token, @_token_type_stack)
      return current_parent
    else
      return next_parent_for(current_parent.parent_token, insertable_token)
    end
  end

  def leaves
  end

  def terminal_leaves
  end
end