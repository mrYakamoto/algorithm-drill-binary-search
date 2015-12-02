require_relative '../binary_search'

describe 'binary_search_include?' do
  let(:numbers) {[1,2,3,4,5,6,7,8,9,10]}
  it 'returns true if searched-for value is in collection' do
    binary_search_8 = binary_search_include?(8, numbers)
    expect(binary_search_8).to eq true
  end

  it 'returns false if collection is empty' do
    binary_search_empty = binary_search_include?(8, [])
    expect(binary_search_empty).to eq false
  end

  it 'returns true if searched-for value is the only item in the collection' do
    binary_search_single = binary_search_include?(8, [8])
    expect(binary_search_single).to eq true
  end
end


describe 'binary_search' do
  it 'returns index of searched-for item in the collection above middle' do
    binary_search_h = binary_search( "h", ["a","b","c","d","e","f","g","h","i","j","k","l"] )
      expect(binary_search_h).to eq 7
  end
  it 'returns index of searched-for item in the collection below middle' do
    binary_search_b = binary_search( "b", ["a","b","c","d","e","f","g","h","i","j","k","l"] )
      expect(binary_search_b).to eq 1
  end
  it 'returns nil if searched-for object is not in the collection' do
    binary_search_x = binary_search( "x", ["a","b","c","d","e","f","g","h","i","j","k","l"] )
      expect(binary_search_x).to eq nil
  end
end

