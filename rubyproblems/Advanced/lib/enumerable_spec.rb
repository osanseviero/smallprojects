require_relative "enumerable"

describe 'enumerable' do
  before do
    @a = [1,3,2,4,5,7,10]
  end

  describe 'my_each method' do
    it 'squares each element of array' do
      b = Array.new
      @a.my_each { |i| b << i**2 }
      expect(b).to eq [1,9,4,16,25,49,100]
    end
	end

	describe 'my_each_with_index method' do
    it 'displays values and index' do
      b = Array.new
      @a.my_each_with_index { |val, idx| b << [val,idx] }
      expect(b).to eq [[1,0], [3,1], [2,2] ,[4,3], [5,4] ,[7,5] ,[10,6]]
    end
	end

	describe 'my_select method' do
    it 'selects numbers bigger than 5' do
      expect(@a.my_select { |a| a > 5 }).to eq [7,10]
    end
    it 'selects even numbers' do
      expect(@a.my_select { |a| a % 2 == 0 }).to eq [2,4,10]
    end
	end

	describe 'my_all? method' do
    it 'checks if all numbers are positive' do
      expect(@a.my_all? { |a| a > 0 }).to eq true
    end
    it 'checks a false condition' do
      expect(@a.my_all? { |a| a == 0 }).to eq false
    end
	end

  describe 'my_any? method' do
    it 'checks if any number is positive' do
      expect(@a.my_any? { |a| a > 0 }).to eq true
    end
    it 'checks if any number is even' do
      expect(@a.my_any? { |a| a % 2 == 0 }).to eq true
    end
     it 'checks a false condition' do
      expect(@a.my_any? { |a| a == 0 }).to eq false
    end
  end

  describe 'my_none? method' do
    it 'checks if none of the words has length 5' do
      expect(["ant","cat","bear"].my_none? { |a| a.length == 5 }).to eq true
    end
    it 'checks if none of the numbers is bigger than 10' do
      expect(@a.my_none? { |a| a > 10 }).to eq true
    end
     it 'checks a false condition' do
      expect(@a.my_none? { |a| a == 3 }).to eq false
    end
  end








end