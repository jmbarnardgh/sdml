require 'json'

# JSON Extension on Token
class Token
   
    def to_json
        c_hash = self.contents
        m_hash = self.metacontents
        merged_hashes = c_hash.merge m_hash
        merged_hashes.to_json
    end
end