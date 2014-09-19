class Movie
	attr_accessor :title
	attr_accessor :rating
	attr_accessor :index

	def initialize (title)
		@title = title
		@rating = get_rating
	end

	def push_film_stars
		@film_stars = ""
		@film_stars << "*" * self.rating + " " * (10 - self.rating)
	end

	def title
		@title
	end

	def get_rating
		rating = Imdb::Search.new(@title).movies.first.rating
	end
end
