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
