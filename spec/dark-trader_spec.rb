require_relative '../lib/dark-trader.rb'

describe "check the function work without error" do
  it "check empty result" do
    expect(crypto_scrapper().count > 0).to eq true
  end
end
describe "check the function return acceptable result" do
  it "check empty result" do
    expect(crypto_scrapper().count > 3).to eq true
    expect(crypto_scrapper().first.include?("BTC")).to eq true
  end
end