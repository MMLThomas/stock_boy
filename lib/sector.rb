class Sector
    attr_accessor :name

    @@all = []


    def initialize(name)
        @name = name
        @stocks = []
        save
    end

    def name
        @name
    end

    def save
        @@all << self
    end

    def self.all
        @@all
    end

    def add_stock(stock)
        self.stocks << stock
    end

    def self.find_by_name(name)
        self.all.detect{|sector| sector.name == name}
    end


    
end