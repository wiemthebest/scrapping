require 'rubygems'
require 'nokogiri'
require 'open-uri'

def get_townhall_urls 

  page = Nokogiri::HTML(URI.open("https://www2.assemblee-nationale.fr/deputes/liste/alphabetique"))

  townhalls = Array.new 

  page.css('//div[@id=deputes-list]//ul//li//a/@href').each do |href| # boucle pour extraire les liens des villes
    # variable townhall permet faire le lien avec chaque maire de l'oise "complete_url"  pour récupérer les adresse  mail
    complete_url = "https://www2.assemblee-nationale.fr" + href.to_s 
    townhalls.push(get_townhall_email(complete_url))

  end

  return townhalls

end

def get_townhall_email(townhall_url)
  begin
 townhall = Nokogiri::HTML(URI.open(townhall_url))
 # on extrait le nom de la ville de la deuxieme balise H1 avec un split sur " - " pour supprimer le code postale
 firstName = townhall.css(".titre-bandeau-bleu h1").text.split(" ")[1]
 lastName = townhall.css(".titre-bandeau-bleu h1").text.split(" ")[1]
 # on selectionne la 4eme tr et la deuxieme td pour l'email
 email = townhall.css(".deputes-liste-attributs dd")[3].css("ul li")[1].css("a").text
 puts "député #{firstName} #{lastName} a l'adresse email #{email}"
 h = { 
  "first_name" => firstName,
  "last_name" => lastName,
  "email" => email
}
rescue => e
puts "une erreur s'est produit sur le depute #{townhall_url}"
puts {}
end
 return h
end
get_townhall_urls()