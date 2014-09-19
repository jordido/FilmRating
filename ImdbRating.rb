require 'imdb'
require 'pry'

class Rating
	def initialize (file)
		@file = file
		@stars_map = []
	end

	def push_stars (rating)
		film_stars = ""
		film_stars << "*" * rating + " " * (10 - rating)
		@stars_map << film_stars
	end

	def print_stars
		puts @stars_map.inspect
		@print_line = ""
		i = 9
		while i >= 0 do 
			@stars_map.each do |x|
				@print_line << x[i]
			end
			puts @print_line
			@print_line = ""
			i -= 1
		end
	end

	def rating_of_films
		File.open(@file) do |films|
				films.each do |film_title| 
					f = Imdb::Search.new(film_title)
					rating = f.movies.first.rating
					push_stars(rating.to_i)
					puts rating
				end
		end
		print_stars
	end

end

R = Rating.new('FilmsList.txt').rating_of_films