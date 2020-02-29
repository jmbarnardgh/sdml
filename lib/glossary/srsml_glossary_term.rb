class SDMLGlossaryTerm

    attr_accessor :term_name, :alternates, :case_handling, :scope, :explanation, :synonyms

    def init()

    end
    
    # @return flag describing the nature of how the provided text is either
    # entirely or partially is not in sync with this term's scope
    def flags_for(text)

    end

end