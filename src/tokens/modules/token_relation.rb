# A set of properties that allows for Token objects
# to determine their relationship(s) or potential
# relationship(s) with other tokens. 
module TokenRelation

  # @return [Boolean] whether the provided token can
  #   be a child of this token
  def can_be_child_of?(token)
    # TODO: raise error if not token
    if token.metacontents[:relatableness].include?(:leaf)
        puts "found a leaf!"
    end
  end
end