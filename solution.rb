# Please copy/paste all three classes into this file to submit your solution!

class Viewer
  attr_reader :first_name, :last_name

  @@viewers = []

  def initialize(first_name, last_name)
    @first_name = first_name
    @last_name = last_name
    @@viewers << self
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  def self.all
    @@viewers
  end

  def self.find_by_name(name)
    @@viewers.find do |name|
      name.full_name = name
    end
  end

  def create_rating(score, movie)
    Rating.new(self, score, movie)
  end

end

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
