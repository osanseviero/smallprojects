module Enumerable
	def my_each
		for element in self
			yield(element)
		end
	end

	def my_each_with_index
		idx = 0
		while idx < self.length
			yield(self[idx],idx)
			idx += 1
		end
	end

	def my_select
		idx = 0
		ans = []
		self.my_each{|x|
			if yield(x)
				ans << x
			end
		}
		return ans
	end

	def my_all?
		self.my_each{|x| return false if !yield(x)
		}
		return true
	end

	def my_any?
		self.my_each{|x| return true if yield(x)}
		return false
	end

	def my_none?
		self.my_each{|x|return false if yield(x)}
		return true
	end

	def my_count(par=nil)
		count = 0
		if block_given?
			self.my_each{|x| count +=1 if yield(x)}
		elsif par == nil	
			self.my_each{|x| count += 1}
		else
			self.my_each{|x| count +=1 if x == par}
		end
		return count
	end

	def my_map
		idx = 0
		ans = []
		self.my_each{|x|
			ans << yield(x)
		}
		return ans
	end





end

