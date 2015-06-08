
require_relative "building_blocks"

describe "caesar cipher" do
	it "works with one letter" do
		expect(caesar_cipher("a", 1)).to eq("b")
	end
	it "works around the abecedary" do
		expect(caesar_cipher("z", 1)).to eq("a")
	end
	it "works with signs and spaces" do
		expect(caesar_cipher("He y!", 1)).to eq("If z!")
	end
  it "works with case example" do
    expect(caesar_cipher("What a string!", 5)).to eq("Bmfy f xywnsl!")
  end
end
