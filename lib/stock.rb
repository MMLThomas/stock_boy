class Stock
    attr_accessor :ticker, :name, :price, :volume, :high, :low, :momentum, :sector, :industry

    @@all = []

    def initialize(ticker:, name:, sector:)
        @name = name
        @ticker = ticker
        @sector = sector
        add_sector
    end

    def self.all
        @@all
    end

    def add_sector
        @sector = Sector.all.each do |sector| 
            if sector.name == @sector
                @sector = sector
            end
        end
        @sector.add_stock(self)
    end

    def save
        @@all << self
    end














end