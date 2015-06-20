class Location
	attr_accessor :position, :path	
	def initialize(position, path)
		@position = position
		@path = path
	end
end

def is_valid_position?(pos)
	if (pos[0] > -1 && pos[0] < 8) && (pos[1] > -1 && pos[1] < 8)
		return true
	else
		return false
	end
end

# Selects moves that are valid
def possible_moves(pos)
	changes = [[-2,-1],[-2,1],[-1,-2],[-1,2],[2,-1],[2,1],[1,-2],[1,2]]
	moves = []
	changes.each { |change| moves << [pos[0]+change[0], pos[1]+change[1]] }
	moves.select { |move| is_valid_position?(move) }
end

def knight_moves(start, finish)
	return "You entered an invalid starting position" unless is_valid_position?(start) 
	return "You entered an invalid ending position" unless is_valid_position?(finish)
	return "You're already on that position!" if start == finish

	queue = [Location.new(start, [start])]	# We put the element in the board in the queue
	visited = [start]

	until queue.empty?
		# Make the first BoardSquare in the queue the current BoardSquare
		current = queue.shift 

		# Find all possible moves for the current position that have not already been visited
		possible_moves = possible_moves(current.position).select { |move| !visited.include?(move) }
		
		# If we can move there directly, we just move.
		if possible_moves.include?(finish)
			current.path << finish
			if current.path.size-1 == 1
				puts "You made it in #{current.path.size-1} move! Here's your path:"
			else
				puts "You made it in #{current.path.size-1} moves! Here's your path"
			end
			current.path.each { |pos| p pos }
			return
		end
		
		# If we need to move to another place
		possible_moves.each do |move|
			queue << Location.new(move, (current.path + [move]))
			visited << move
		end

	end
end


puts knight_moves([3,3],[4,3])