require_relative '../lib/depute.rb'

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
    url = "https://www2.assemblee-nationale.fr/deputes/fiche/OMC_PA605036"
    #verifier que le hash n'est pas vide
    expect(get_townhall_email(url).empty?).to eq false
  end
end
describe "check get_townhall_email function return acceptable result" do
  it "check empty result" do
    url = "https://www2.assemblee-nationale.fr/deputes/fiche/OMC_PA605036"
    #verifier que le hash contient le nom du depute
    expect(get_townhall_email(url)["first_name"]).to eq("Damien")
  end
end