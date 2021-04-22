#! /usr/bin/env ruby

require 'nokogiri'
require 'open-uri'
def crypto_scrapper
    begin
# Fetch and parse HTML document
doc = Nokogiri::HTML(URI.open('https://coinmarketcap.com/all/views/all/'))
tab = Array.new
# Search for nodes by css
doc.css('.cmc-main-section table tr.cmc-table-row').each do |data|
    s = String.new
    p = String.new
 data.css('td.cmc-table__cell--sort-by__symbol div').each do |symbol|
   s = symbol.content
  end
  data.css('div.price___3rj7O a.cmc-link').each do |price|
    p = price.content[1,10].to_f
   end
   
   h = {s => p}
   tab.push(h)
  # puts h
end
return tab
rescue => e
    puts "une erreur s'est produite" 
    return nil
  end
end