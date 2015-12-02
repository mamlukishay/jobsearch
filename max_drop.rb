class BST 
	attr_accessor :root

	def add(key:, value:)
		new_node = Node.new(key, value)
		
		if self.root
			puts "to: #{root.value}"
			root.add(new_node)
		else
			puts "new root: #{new_node.value}"
			self.root = new_node
			new_node.parent = self.root
		end
	end

	def max
		return nil if root.nil?
		max_of root
	end

	def to_s
		inprint(root)
	end

private
	def max_of(node)
		while node.right
			node = node.right
		end

		node
	end

	def inprint(node)
		return "" unless node
		"#{inprint(node.left)}, #{node}, #{inprint(node.right)}"
	end
end

class Node
	attr_accessor :parent
	attr_accessor :left
	attr_accessor :right
	attr_accessor :key
	attr_accessor :value

	def initialize(key, value)
		self.key = key
		self.value = value
	end

	def add(node)
		if node.key < self.key
			if self.left
				self.left.add(node) 
			else
				self.left = node
				node.parent = self
			end
		else
			if self.right
				self.right.add(node) 
			else
				self.right = node
				node.parent = self
			end			
		end
	end

	def to_s
		"[#{self.key}, #{self.value}]"		
	end
end

def max_drop(arr)
	tree = BST.new

	last_item = arr[0]
	(1..arr.size - 1).each do |index|
		drop = -1 * (arr[index] - last_item)
		tree.add key: drop, value: index
		last_item = arr[index]
	end

	puts tree
	puts "----------"
	tree.max.key
end

p max_drop([1,10,8,6,1,5])


