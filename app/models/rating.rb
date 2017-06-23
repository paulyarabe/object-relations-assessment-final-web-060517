class Rating
  attr_reader :score, :movie, :viewer

  @@ratings = []

  def initialize(viewer, score, movie)
    @score = score
    @movie = movie
    @viewer = viewer
    @@ratings << self
  end

  def self.all
    @@ratings
  end

end
