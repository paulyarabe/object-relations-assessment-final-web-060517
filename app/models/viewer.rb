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
