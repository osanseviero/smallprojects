require_relative "adv_building_blocks"

describe "bubble sort" do
	it "works" do
		expect(bubble_sort([4,3,78,2,0,2])).to eq  [0,2,2,3,4,78]
	end
end

describe "bubble sort by method" do
	it "works for alphabetical order" do
		expect(bubble_sort_by(["hi","hello","hey"]) { |left, right| left.length - right.length }).to eq ["hello", "hey", "hi"]
	end
	it "works from right to left" do
		expect(bubble_sort_by(["hi","hello","hey"]) { |left, right| right.length - left.length }). to eq ["hi", "hey", "hello"]
	end
end