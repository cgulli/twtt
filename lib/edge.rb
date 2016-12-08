class Edge
attr_reader :start, :finish, :weight
  def initialize(start, finish, weight)
      @start = start
      @finish = finish
      @weight = weight
  end
end
