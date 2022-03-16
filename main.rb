# Dynamic programming solution.
# Build a running tally of shortest distances from start cell to every other.
# Essentially do a breadt-first search from the start node, sans building an actual graph.

L_OFFSETS = [-2, 2].product([-1, 1]) + [-1, 1].product([-2, 2])

# Returns valid (not going out of the board) knight moves from a starting square 
def moves_from(file, rank)
  L_OFFSETS.map { |f, r| [f + file, r + rank] }.select { |f, r| f.between?(0, 7) && r.between?(0, 7) }
end

def pair_to_index(file, rank)
  rank * 8 + file
end

def index_to_pair(index)
  [index % 8, index / 8]
end

# Returns (one) shortest path between starting and ending square on the chess board
def knight_moves(from, to)
  distances = Array.new(64, nil)

  # Search
  step = 0
  distances[pair_to_index(*from)] = step
  
  (0...64).cycle do |i|
    if distances[i] == step
      found = false
      possible_moves = moves_from(*index_to_pair(i))
      possible_moves.each do |file, rank|
        pm_index = pair_to_index(file, rank)
        distances[pm_index] = step + 1 if distances[pm_index].nil?  # if not nil, it's already been visited
        found = true if [file, rank] == to # we reached target square
      end

      break if found
    end

    step += 1 if i == 63 # increment step count after whole cycle
  end

  # Backtrack  
  path = [to]
  step = distances[pair_to_index(*to)] - 1

  until step < 0 do
    next_square = moves_from(*path.first).find { |file, rank| distances[pair_to_index(file, rank)] == step }
    path.unshift next_square

    step -= 1
  end

  path
end
