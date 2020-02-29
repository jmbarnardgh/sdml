
class SDMLGLossaryDefinition

    attr_accessor :type, :scope, :terms

    def init(type, scope, terms)
        @type  = type
        @scope = scope
        @terms = terms
    end
end