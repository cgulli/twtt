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

  def distance(path)
        dist = 0
        path.each_char.map.inject do |start, finish|
          return 'NO SUCH ROUTE' unless @edges.any? { |edge| edge.start == start && edge.finish == finish}
          correct_edge = @edges.find { |edge| edge.start == start && edge.finish == finish }
          dist += correct_edge.weight
          finish
        end
        dist
  end

  
