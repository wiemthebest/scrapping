require_relative '../lib/mairie.rb'

describe "check the main function work without error" do
  it "check empty result" do
    #verifier que la fonction retourne un tableau
    expect(get_townhall_urls().count > 0).to eq true
  end
end
describe "check the main function return acceptable result" do
  it "check empty result" do
    expect(get_townhall_urls().count > 3).to eq true
  end
end

describe "check get_townhall_email function work without error" do
  it "check empty result" do
    url = "http://annuaire-des-mairies.com/95/amenucourt.html"
    #verifier que le hash n'est pas vide
    expect(get_townhall_email(url).empty?).to eq false
  end
end
describe "check get_townhall_email function return acceptable result" do
  it "check empty result" do
    url = "http://annuaire-des-mairies.com/95/amenucourt.html"
    #verifier que le hash contient le nom de la ville
    expect(get_townhall_email(url).dig("AMENUCOURT")).not_to eq nil
  end
end