require 'pry'

class Node
  attr_accessor :key, :parent, :left, :right

  def initialize(key, parent = nil)
    self.key = key
    self.parent = parent
  end

  def self.inorder_print(node)
    return if node.nil?
    inorder_print node.left
    puts node.key
    inorder_print node.right
  end

  def add_left(key)
    self.left = Node.new(key, self)
  end

  def add_right(key)
    self.right = Node.new(key, self)
  end

	def to_s
		self.key
	end
end

def inorder_iter_print(root)
	stack = []
	current = root

	begin
		while current do
			stack.push current
			current = current.left
		end

		if current.nil?
			popped = stack.pop
			puts popped.key
			current = popped.right			
		end
	end until stack.empty? && current.nil?
end

tree = Node.new 12
tree.add_left(8).add_right(9).add_right(11)
tree.left.add_left(4).add_right(5)
tree.left.left.add_left(2).add_right(3)
tree.add_right(15)

inorder_iter_print tree