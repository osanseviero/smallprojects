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
		self.my_each{|x|
			yield(x)
		}
	end


end

