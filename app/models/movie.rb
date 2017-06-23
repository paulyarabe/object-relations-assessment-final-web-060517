class Movie
  attr_accessor :title

  @@movies = []

  def initialize(title)
    self.title = title
    @@movies << self
  end

  def self.all
    @@movies
  end

  def self.find_by_title(title)
    @@movies.find do |movie|
      movie.title == title
    end
  end

  def ratings
    Rating.all.select do |rating|
      rating.movie == self
    end
  end

  def viewers
    ratings.select do |rating|
      rating.viewers
    end
  end

  def average_rating
    arr = ratings.select do |rating|
      rating.score
    end
    score = 0
    arr.each do |score|
      score += score
    end
    score / arr.length
  end

end
