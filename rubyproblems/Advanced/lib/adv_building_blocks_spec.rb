require_relative "adv_building_blocks"

describe "bubble sort" do
	it "works" do
		expect(bubble_sort([4,3,78,2,0,2])).to eq  [0,2,2,3,4,78]
	end
end
