require 'pry'

 class CLI

    def call
        puts "Welcome to Stock Boy!"
        @input = nil 
        until @input == 'exit'
            get_sectors
            list_sectors
            users_choice
            continue
        end
        goodbye
    end


    def get_sectors
        @sectors = Sector.all
    end

    def list_sectors
        puts "Select an sector to see stocks"
        @sectors.each.with_index(1) do |sector, index|
            puts "#{index}. #{sector.name}"
        end
    end

    def users_choice
        choice = gets.strip.to_i
        show_stocks_for(choice) if valid_input(choice, @sectors)
    end
    
    def valid_input(input, data)
        input <= data.length && input > 0
    end


    def show_stocks_for(users_choice)
        sector = @sectors[users_choice - 1]
        puts "These are the stocks in the #{sector.name} sector."
        sector.stocks.each.with_index(1) do |sector, index|
          puts "#{index}. #{sector.name}"
        end
        get_user_stock(sector)
    end

    def get_user_stock(sector)
        puts "Select a stock to see more info."
        input = gets.strip
        stock = sector[input - 1]
        show_stock_details(stock)
    end

    def show_stock_details(stock)
        Scrapper.stock_info_scrapper(stock, stock.ticker)
        puts  "(#{stock.ticker}) #{stock.name}"
        puts "Industry: #{stock.industry}"
        puts "Current price: #{stock.price}"
        puts "Volume: #{stock.volume}"
        puts "52 week high: #{stock.high}"
        puts "52 week low: #{stock.low}"
    end

    def continue
        puts "Type 'exit' to exit or hit any key to see more events."
        @input = gets.strip
    end

    def goodbye
        puts "See you later"
    end





 end