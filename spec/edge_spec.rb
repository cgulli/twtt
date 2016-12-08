require 'edge'

describe Edge do
  context '#initialize' do
    edge = Edge.new('A','B', 5)
    it 'has a start node' do
      expect(edge.start).to eq 'A'
      end
    it 'has an end node' do
      expect(edge.terminus). to eq 'B'
    end
    it 'has a weight' do
      expect(edge.weight). to eq 5
    end
  end
end
