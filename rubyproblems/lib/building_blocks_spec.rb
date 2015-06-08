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
  it "works with big numbers" do
    expect(caesar_cipher("Za", 27)).to eq("Ab")
  end
end

describe "stock picker" do
	it "works with example" do
		expect(stock_picker([17,3,6,9,15,8,6,1,10])).to eq [1,4]
	end
	it "works with lowest day at end" do
		expect(stock_picker([3,6,7,15,2])).to eq [0,3]
	end
	it "works with highest day as first" do
		expect(stock_picker([15,3,6,7,4])). to eq [1,3]
	end
end

