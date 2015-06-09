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
	it "works with highest day at first" do
		expect(stock_picker([15,3,6,7,4])). to eq [1,3]
	end
end

describe "substrings method" do
	it "works with one word" do
		dictionary = ["below", "down", "go", "going", "horn", "how", "howdy", "it", "i", "low", "own", "part", "partner", "sit"]
		answer = {
			'below' => 1,
			'low' =>1
		}
		expect(substrings("below",dictionary)).to eq answer
	end
	it "works with one word repeated" do
		dictionary = ["below"]
		answer = {
			'below' => 2,
		}
		expect(substrings("below below",dictionary)).to eq answer
	end

	it "works with more than one word" do
		answer =  {
			"down"=>1, 
			"go"=>1, 
			"going"=>1, 
			"how"=>2, 
			"howdy"=>1,
			"it"=>2, 
			"i"=> 3, 
			"own"=>1,
			"part"=>1,
			"partner"=>1,
			"sit"=>1}
		dictionary = ["below", "down", "go", "going", "horn", "how", "howdy", "it", "i", "low", "own", "part", "partner", "sit"]
		expect(substrings("Howdy partner, sit down! How's it going?",dictionary)).to eq answer
	end

	it "works with an empty dictionary" do
		dictionary = []
		expect(substrings("below",dictionary)).to eq false
	end

	it "works without a word" do
		dictionary = ["hello","world"]
		expect(substrings(' ',dictionary)).to eq false
	end



end

