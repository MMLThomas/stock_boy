require 'pry'

class UserInterface



    def main menu
        puts "Welcome to stock boy! Here are a few options to get you started:"
        puts 'A: Look up a stock price by ticker'
        puts 'B: See the current highest valued stock'
        puts 'C: See current lowest valued stock'
        puts 'D: See stock with the largest single day gain'
        puts 'E: See stock with the largest single day loss'
        puts 'F: look up a stocks momentum by ticker'
        puts 'G: See stock with the most momentum' 
        ##puts 'H: See stock with the most momentum based on industry'
        puts 'I: Compare 2 stocks' 
        ##puts 'J: See your favorite stocks'
        puts 'Please enter the letter of your selection, or type \'exit\' to quit'
        
        while input = gets.chomp
            if input == 'exit'
                puts 'Thank you, have a nice day.'
                break
            elsif input == 'A'
                puts 'Please input the ticker of your desired stock'
                ticker = gets.chomp.upcase.to_sym
                ticker_price_lookup(ticker)
            elsif input == 'B'
                highest_valued_stock
            elsif input == 'C'
                lowest_valued_stock
            elsif input == 'D'
                largest_single_day_gain
            elsif input == 'E'
                largest_single_day_loss
            elsif input == 'F'
                momentum_by_ticker
                puts 'Please input the ticker of your desired stock'
                ticker = gets.chomp.upcase.to_sym
                momentum_by_ticker(ticker)
            elsif input == 'G'
                highest_momentum_stock
            ##elsif input == 'H'

            elsif input == 'I'

            elsif input == 'J'

            else  
                puts 'Please enter a valid selection'
            end

    end


        def ticker_price_lookup(ticker)
            

        end


        def highest_valued_stock
  
        end

        def lowest_valued_stock

        end

        def largest_single_day_gain

        end

        def largest_single_day_loss

        end

        def momentum_by_ticker(ticker)

        end

        def highest_momentum_stock

        end

        #def highest_momentum_stock_by_industry
        #    puts 'Please select an industry:'
        #
        #end

        def compare_stocks
            puts 'Please enter your first stock to compare:'
            while stock_one = gets.chomp
                if !stock_one.is_valid_stock
                    puts 'Please enter valid ticker symbol'
                else puts "Please enter the stock you would like to compare with #{stock_one.upcase }"
                end
            end
            while stock_two = gets.chomp
                if !stock_two.is_valid_stock
                    puts 'Please enter valid ticker symbol'
                end
            end



        end

        










end