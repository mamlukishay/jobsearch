require 'pry'

class Node
	attr_accessor :key, :parent, :children

	def initialize(key, parent = nil)
		self.key = key
		self.parent = parent
		self.children = []
	end

	def add_left(key)
		n = Node.new(key, self)
		self.children.unshift n
		n
	end

	def add_right(key)
		n = Node.new(key, self)
		self.children.push n
		n
	end	
	
	def has_children?
		self.children.size > 0
	end

	def to_s
		self.key
	end
end

def post_order_iter_print(root)
	stack = []
	to_print = []
	stack.push root

	while stack.size > 0 do
		node = stack.pop
		to_print.push node
		stack.push *node.children
		# node.children.each {|c| stack.push c}
	end

	to_print.size.times do
		puts to_print.pop
	end
end


tree = Node.new 1
tree.add_left(2).add_right(4)
tree.add_right(3).add_right(5)

post_order_iter_print tree