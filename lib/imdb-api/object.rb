module ImdbApi
  class Object < ::Hashr
    
    def self.deserialize(string)
      json = JSON.parse(string)
      
      
      raise InvalidDataError, "Invalid Hash returned. Expected [\"data\"]" unless json.has_key?("data")
      
      # Array
      if json["data"].has_key?("list")
        xch = json["data"].select{|k,v| v.is_a? Array}
        if xch == {} && json["data"]["list"].has_key?("list")
          xch = json["data"]["list"].select{|k,v| v.is_a? Array} 
        end
      end
      
      if xch["list"].is_a? Array
        xch["list"].map {|item| self.new(item)}
      else
        self.new(xch["list"])
      end
    end
    
    def initialize(hash = {})
      super(hash)
    end
  end
end
