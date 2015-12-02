def successor_search(node)
	if node.right
		return min_of node.right
	else
		return first_right_ancestor_of node
	end
end

def min_of(node)
	while node.left
		node = node.left
	end

	node
end

def first_right_ancestor_of(node)
	parent = node.parent
	
	while parent && node == parent.right
		node = parent
		parent = node.parent
	end

	parent	
end

def first_bigger_ancestor_of(node)
	while node.parent
		if parent.value > node.value  
			return parent
		else
			node = node.parent
		end
	end

	nil
end