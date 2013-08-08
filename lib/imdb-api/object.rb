module ImdbApi
  class Object < ::Hashr
    
    def self.deserialize(string)
      json = JSON.parse(string)
      raise InvalidDataError, "Invalid Hash returned. Expected [\"data\"][\"list\"][\"list\"]" unless json.has_key?("data")
      if json["data"]["list"]["list"].is_a? Array
        json["data"]["list"]["list"].map {|item| self.new(item)}
      else
        self.new(json)
      end
    end
    
    def initialize(hash = {})
      super(hash)
    end
  end
end
