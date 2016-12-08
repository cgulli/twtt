class Edge
attr_reader :start, :terminus, :weight
  def initialize(start, terminus, weight)
      @start = start
      @terminus = terminus
      @weight = weight
  end
end
