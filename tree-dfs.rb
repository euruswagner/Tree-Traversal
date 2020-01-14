class Tree
  attr_accessor :payload, :children

  def initialize(payload, children)
    @payload = payload
    @children = children
  end

end

def dfs(target, node)
  return nil if not node
  return node if node.payload == target
  node.children.each do |child|
    res = dfs(target, child)
    return res if res
  end
  return nil
end

def dfs_s(target, node)
  stack = [node]
  visited = []
  while not stack.empty? do
    c = stack.pop
    next if visited.include? c
    return c if c.payload == target
    visited.push c
    c.children.each do |child|
      stack.push child
    end
  end
  return nil
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

res = dfs(11, trunk)
puts "Found! " + res.payload.to_s if res
puts res.inspect

res = dfs_s(11, trunk)
puts "Found! " + res.payload.to_s if res
puts res.inspect
