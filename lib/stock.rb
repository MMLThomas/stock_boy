require 'pry'
class Stock
    attr_accessor :ticker, :name, :price, :volume, :high, :low, :momentum, :sector, :industry

    @@all = []

    def initialize(ticker, name, sector)
        @name = name
        @ticker = ticker
        if sector != nil
            @sector = Sector.find_by_name(sector)
            add_to_sector
        end
        #binding.pry
        #add_to_sector
    end

    def self.all
        @@all
    end

    def add_to_sector
        @sector.stocks << self
    end

    # def add_to_sector
    #     self.sector.add_stocks(self)
    # end

    def save
        @@all << self
    end














end