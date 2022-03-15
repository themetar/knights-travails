# Dynamic programming solution.
# Build a running tally of distances from start cell to every other.
# Essentially do a breadt-first search from the start node, sans building an actual graph.

L_OFFSETS = [-2, 2].product([-1, 1]) + [-1, 1].product([-2, 2])

# Returns valid (not going out of the board) knight moves from a starting square 
def moves_from(file, rank)
  L_OFFSETS.map { |f, r| [f + file, r + rank] }.select { |f, r| f.between?(0, 7) && r.between?(0, 7) }
end
