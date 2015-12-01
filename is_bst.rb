
class Node
  attr_accessor :key, :parent, :left, :right

  def initialize(key, parent)
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
end


def is_bst?(node)
  return false if node.nil?
  return true if node.left.nil? && node.right.nil?

  is_bst = true

  is_bst = is_bst && is_bst?(node.left) && node.left.key < node.key if node.left
  is_bst = is_bst && is_bst?(node.right) && node.right.key > node.key if node.right
end


def create_bst_tree
  root = Node.new(10, nil)
  tmp = root.add_left(5)
  tmp.add_left(1)
  tmp = tmp.add_right(6)
  tmp.add_right(7)
  root.add_right(11)

  root
end

def create_non_bst_tree
  root = Node.new(10, nil)
  tmp = root.add_left(15)
  tmp.add_left(1)
  tmp = tmp.add_right(6)
  tmp.add_right(7)
  root.add_right(11)

  root
end

puts "for bst: #{is_bst?(create_bst_tree)}"
puts "for non-bst: #{is_bst?(create_non_bst_tree)}"
