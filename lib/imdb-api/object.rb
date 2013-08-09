module ImdbApi
  class Object < ::Hashr
    
    # == Validates given String for valid json
    #
    # string - String
    #
    # TODO: find faster implementation
    #
    # Returns Boolean true-false
    def self.valid_json?(string)
      JSON.parse(string)
      return true
    rescue JSON::ParserError
      return false
    end
    
    # == Checks if given JSON string is empty
    #
    # string - A String
    #
    #
    # Returns Boolean true-false
    def self.empty_json?(string)
      string.nil? || JSON.parse(string).empty?
    end
    
    def self.deserialize(string)
      
      json = JSON.parse(string)
      
      
      raise InvalidDataError, "Invalid input Hash. Expected hash key [\"data\"]" unless json.has_key?("data")
      
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
      self.instance_eval{ attr_accessor :actors, :principals} if self.principals?
    end
  end
end
