class Tree
  attr_accessor :payload, :children

  def initialize(payload, children)
    @payload = payload
    @children = children
  end

end

def bfs(target, node) 
  queue = []
  queue.push(node)

  while not queue.empty? do 
    current_node = queue.shift
    return false if current_node == nil
    return current_node if current_node.payload == target

    current_node.children.each { |child| queue.push(child) }
  end
end

# The "Leafs" of a tree, elements that have no children
deep_fifth_node = Tree.new(5, [])
eleventh_node = Tree.new(11, [])
fourth_node   = Tree.new(4, [])

# The "Branches" of the tree
ninth_node = Tree.new(9, [fourth_node])
sixth_node = Tree.new(6, [deep_fifth_node, eleventh_node])
seventh_node = Tree.new(7, [sixth_node])
shallow_fifth_node = Tree.new(5, [ninth_node])

# The "Trunk" of the tree
trunk   = Tree.new(2, [seventh_node, shallow_fifth_node])

res = bfs(11, trunk)
puts "Found! " + res.payload.to_s if res
puts res.inspect