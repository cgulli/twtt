require 'graph'
require 'edge'

describe Graph do

  context '#initialize'do
  graph = Graph.new
    it 'stores a collection of nodes/stations' do
      expect(graph.nodes).to be_empty
    end
  end

  context '#creates routes' do
    graph = Graph.new
    it 'adds nodes to array' do
      expect(graph).to respond_to(:add_node).with(1).argument
    end
    it 'adds an edge' do
      expect(graph).to respond_to(:add_edge).with(3).arguments
      #refactor into a better test
    end
  end

  context '#manages nodes' do
    graph = Graph.new
    graph.add_node('A')
    graph.add_node('B')
    it 'finds nodes by name' do
      respond_to(:find_node).with(1).argument
      #refactor into a better test
    end
    it 'counts nodes' do
      respond_to(:node_count).with(2)
    end
  end
end