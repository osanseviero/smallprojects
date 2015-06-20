class Node
	attr_accessor :value, :parent, :left, :right

	def initialize(value, parent_value = nil, left_child = nil, right_child = nil)
		@value = value
		@parent = parent_value
		@left = left_child
		@right = right_child
	end

end

def build_tree(array)
  root = Node.new(array.shift)
  array.each {|x| place_node(node = Node.new(x), root)}
  root
end

def place_node(node, parent)
  node.parent = parent
  if node.value > parent.value
    if parent.right.nil? 
    	parent.right = node
    else  
    	place_node(node, parent.right)
    end
  else
  	if parent.left.nil? 
    	parent.left = node
    else  
    	place_node(node, parent.left)
    end
  end
end

def breadth_first_search(n, node)
	queue = [node]
	while queue.size > 0
		return queue[0] if queue[0].value == n
		queue << queue[0].left if queue[0].left != nil
    queue << queue[0].right if queue[0].right != nil
    queue.shift # Take out first element from queue
  end
end

tree = build_tree([5,7,1,4,9,7,8,3])
breadth_first_search(8, tree)