require_relative '../main.rb'

describe 'moves_from' do
  it 'returns two squares from 0, 0' do
    expect(moves_from(0, 0)).to eq([[2, 1], [1, 2]])
  end

  it 'returns 8 squares from the middle of the board' do
    expect(moves_from(3, 4).sort).to eq([[4, 6], [4, 2], [2, 2], [2, 6], [5, 3], [5, 5], [1, 3], [1, 5]].sort)  # .sort so I don't sort them manually
  end
end

describe 'from/to_index' do
  it 'converts' do
    for rank in (0..7)
      for file in (0..7)
        expect(index_to_pair(pair_to_index(file, rank))).to eq([file, rank])
      end
    end    
  end 
end

describe 'knight_moves' do
  xit 'handles zero steps' do
    expect(knight_moves([0, 0], [0, 0])).to eq([[0, 0]])
    expect(knight_moves([2, 3], [2, 3])).to eq([[2, 3]])
  end

  xit 'handles one step' do
    expect(knight_moves([0, 0], [1, 2])). to eq([[0, 0], [1, 2]])
  end

  xit 'handles two steps' do
    expect(knight_moves([0, 0], [3, 3])).to eq([[0, 0], [1, 2], [3, 3]]).or eq([[0, 0], [2, 1], [3, 3]])  # might have two shortest paths
    expect(knight_moves([3, 3], [0, 0])).to eq([[3, 3], [1, 2], [0, 0]]).or eq([[3, 3], [2, 1], [0, 0]])
  end

  xit 'handles three steps' do
    expect(knight_moves([3, 3], [4, 3])).to eq([[3, 3], [4, 5], [2, 4], [4, 3]])  # might have several shortest paths
                                        .or eq([[3, 3], [1, 2], [2, 4], [4, 3]])
                                        .or eq([[3, 3], [1, 4], [2, 2], [4, 3]])
                                        .or eq([[3, 3], [4, 1], [2, 2], [4, 3]])
                                        .or eq([[3, 3], [1, 2], [3, 1], [4, 3]])
                                        .or eq([[3, 3], [5, 2], [3, 1], [4, 3]])
                                        .or eq([[3, 3], [1, 4], [3, 5], [4, 3]])
                                        .or eq([[3, 3], [5, 4], [3, 5], [4, 3]])
                                        .or eq([[3, 3], [4, 1], [6, 2], [4, 3]])
                                        .or eq([[3, 3], [5, 4], [6, 2], [4, 3]])
                                        .or eq([[3, 3], [4, 5], [6, 4], [4, 3]])
                                        .or eq([[3, 3], [5, 2], [6, 4], [4, 3]])
  end
end
