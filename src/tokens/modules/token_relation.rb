# A set of properties that allows for Token objects
# to determine their relationship(s) or potential
# relationship(s) with other tokens. 
module TokenRelation

  # Given a Token object, determine if this token can parent the provided token.
  #
  # Algorithm:
  # The token in question is evaluated based on its @relatableness property.
  # The following criteria must be met in order for the token in question to
  # be able to be parented by the calling Token object.
  #
  #   1. token.relatableness[:leafable] == true
  #   2. token.relatableness[:indentation_depth] > self.relatableness[:indentation_depth]
  #   3. if token.relatableness[:expects_connective_verb_parent] == true, then
  #      self must have token.relatableness[:connective_verb] == true
  #   4. if token.relatableness[:expects_connective_verb_parent] == false, then
  #      self must have [token].relatableness[:connective_verb] == false
  #
  # @param token [Token] the token about which the inquiry is being made
  # @return [Boolean] whether the provided token can
  #   be a child of this token
  def can_parent?(token)
    # TODO: raise if token is not of type Token
    return true if token.is_leafable? &&
                   token.exceeds_indentation_level_of?(self) &&
                   token.can_connectively_parent?(self)
    false
  end

  def is_leafable?
    bool_val = self.relatableness[:leafable]
    # TODO: raise if bool_val is not a boolean
    bool_val
  end

  def exceeds_indentation_level_of?(token)
    a_depth = self.relatableness[:indentation_depth]
    b_depth = token.relatableness[:indentation_depth]
    return true if a_depth > b_depth
    false
  end

  # Returns whether the provided token can be a child of the calling token based
  # on the `@relatableness` values of `:expects_connective_verb_parent` of the
  # would-be child token and `:connective_verb` of the calling token.
  # @return [Boolean]
  def can_connectively_parent?(token)
    return true if token.relatableness[:expects_connective_verb_parent] == true &&
                   self.relatableness[:connective_verb] == true
    return true if token.relatableness[:expects_connective_verb_parent] == false &&
                   self.relatableness[:connective_verb] == false
    false
  end
end