class Graph
attr_accessor :edges

def initialize(testinput=nil)
  @edges = []

end

def parse_n_build(testinput)

  File.read(testinput).scan(/\w\w\d+/).each do |line|
    start = line[0,1]
    finish = line[1,1]
    weight = line[2..-1].to_i
    edge = Edge.new(start, finish, weight)
    @edges << edge
  end
end

end
