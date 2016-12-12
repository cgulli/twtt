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

  def num_of_trips(start, finish, opts= {})
    opts = { :min_stops => 1, :max_stops => Infinity, :max_distance => Infinity}.merge(opts)
    total = 0
    explore_paths(start, finish, opts) { total += 1}
    total
  end

# This is obviously where I got stuck but this gives a sense of where I was going...

#     def explore_paths(start, finish, opts, stats = {:distance => 0, :stops => 0}, &callback)
#       lower_bound_ok = stats[:stops] >= opts[:min_stops]
#       upper_bound_ok = stats[:distance] <= opts[:max_distance] && stats[:stops] <= opts[:max_stops]
# #look up currying eg.call,bind
#
#       callback.call(stats[:path]) if start == finish && lower_bound_ok && upper_bound_ok
#       # Recursion basis: stop exploration when reached upper-bound restrictions
#       if upper_bound_ok
#         @edges[egde.start].each do |nxt, dist|
#           inner_stats = {:distance => stats[:distance] + dist, :stops => stats[:stops] + 1}
#           explore_paths(nxt, finish, opts, inner_stats, &callback)
#         end
#       end
#     end

# count_Trips(start, finish , ...)
# count_Trips(finish, start , ...)
#
#
# funtion count_Trips(current, next, origin=current, stats, opts, callback)
# #current = a
# #next = n
# #[edgeobjid1{start, finish, weight}, edgeobjid1{start, finish, weight}...]
#
#
# for edge in edges:
#   if edge.start == current #find edges that start with current
#   	does edge.finish == next ? if yes and options are OK then increment this trip to total ie.callback
# 	if not: count_trips(edge.finish, next) # increment stops

  #if no edges.start start with current then we have exhausted and found no trips or no node of origin


# above example functions graph model: {nodea:{nodeb:7, noder:3}, nodeb:{noded:3, noder:4}}

#look for array pairs that start with given start node then do next?; look for pairs that finish with given finish node then do prev?

  def shortest_dis(start, finish)

  end
end
