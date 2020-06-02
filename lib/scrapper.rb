require 'open-uri'
require 'nokogiri'
require 'pry'


class Scrapper



    def self.ticker_scrapper

        stocks = []

        #('a'..'z').to_a.each do |alpha|        # Itterates through the website pages containning the tickers for each letter of the alphabet
           # html = "http://www.eoddata.com/stocklist/NYSE/#{alpha}.htm"
           html = "http://www.eoddata.com/stocklist/NYSE/a.htm"

            doc = Nokogiri::HTML(open(html))


            doc.css("table.quotes").first.css("a").map do |ticker| #class idetifiers for tickers alternate between 'ro' and 're' 
                if ticker.text != ""
                ##@@stocks[ticker.text.to_sym] = {}
                stocks << ticker.text
                end
            end
       # end
        stocks

    end


    def self.sector_scrapper
        
        self.ticker_scrapper.each do |ticker|
            sector = ""
            html = "http://eoddata.com/stockquote/NYSE/#{ticker}.htm"
            doc = Nokogiri::HTML(open(html))
            if doc.css("div#content div#col1 div#ctl00_cph1_pnl3 table tr")[1]
                sector = doc.css("div#content div#col1 div#ctl00_cph1_pnl3 table tr")[1].text.split(':')[1]
                if sector != nil && !Sector.find_by_name(sector)
                    Sector.new(sector)
                end
             end
            name = doc.css("table.rc_t td")[1].text

            Stock.new(ticker, name, sector)

            #binding.pry
        end
       #binding.pry

    end



#binding.pry 

    def self.stock_info_scrapper(stock, ticker)
        html = "http://eoddata.com/stockquote/NYSE/#{ticker}.htm"
        doc = Nokogiri::HTML(open(html))
        stock.high = doc.css("div#content div#col1 div#ctl00_cph1_pnl3 table tr td")[26].text.split(' - ')[1]
        stock.low = doc.css("div#content div#col1 div#ctl00_cph1_pnl3 table tr td")[26].text.split(' - ')[0]
        stock.volume = doc.css("div.cb td b")[5].text
        stock.industry = doc.css("div#content div#col1 div#ctl00_cph1_pnl3 table tr td")[6].text
        stock.price = doc.css("div#ctl00_cph1_qp1_div1 b")[0].text
    end
    
end