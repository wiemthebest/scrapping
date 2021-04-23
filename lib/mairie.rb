require 'rubygems'
require 'nokogiri'
require 'open-uri'

def get_townhall_urls 

  page = Nokogiri::HTML(URI.open("http://annuaire-des-mairies.com/val-d-oise.html"))

  townhalls = Array.new 

  page.css('//a[@class=lientxt]/@href').each do |href| # boucle pour extraire les liens des villes
    # variable townhall permet faire le lien avec chaque maire de l'oise "complete_url"  pour récupérer les adresse  mail
    complete_url = "http://annuaire-des-mairies.com/" + href.to_s[2, href.to_s.length] 
    townhalls.push(get_townhall_email(complete_url))

  end

  return townhalls

end

def get_townhall_email(townhall_url)
 townhall = Nokogiri::HTML(URI.open(townhall_url))
 # on extrait le nom de la ville de la deuxieme balise H1 avec un split sur " - " pour supprimer le code postale
 city = townhall.css(".container h1").text.split(" - ")[0]
 # on selectionne la 4eme tr et la deuxieme td pour l'email
 email = townhall.css("tr.txt-primary")[3].css("td")[1].text
 puts "La mairie de #{city} a l'adresse email #{email}"
 h = {city => email}
 return h
end