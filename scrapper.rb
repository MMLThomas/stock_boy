require 'open-uri'
require 'nokogiri'
require 'net/http'
require 'pry'
require 'json'

class Scrapper

    @@stocks = {}

    def self.symbol_scrapper


        ('a'..'z').to_a.each do |alpha|        # Itterates through the website pages containning the tickers for each letter of the alphabet
            html = "http://www.eoddata.com/stocklist/NYSE/#{alpha}.htm"

            doc = Nokogiri::HTML(uopen(html)


            doc.css("table.quotes").first.css("a").each do |ticker| #class idetifiers for tickers alternate between 'ro' and 're' 
                if ticker.text != ""
                @@stocks[ticker.text.to_sym] = {}
                end
            end
        end
    end    
    binding.pry   

    # def self.stock_profile_scrapper

    #     @@stocks.each do |ticker|
    #         html = "http://eoddata.com/stockquote/NYSE/#{ticker.to_s}.htm"
    #         doc = Nokogiri::HTML(open(html))

    #         doc.css("table").each do |value|


    #         end
    #     end


    # end



end