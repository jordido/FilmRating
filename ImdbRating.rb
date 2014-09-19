require 'imdb'
require 'pry'

class Rating
	def initialize (file)
		@file = file
		@stars_map = []   # Array of strings (1 per film) containing n-stars 
		load_film_list
	end

	def load_film_list # for initializing ratings
		File.open(@file) do |films|
				films.each do |film_title| 
					search_rating(film_title)
				end
		end
	end

	def push_film_stars (rating)
		film_stars = ""
		film_stars << "*" * rating + " " * (10 - rating)
		@stars_map << film_stars
	end

	def print_stars
		@print_line = ""
		for i in 9.downto 0
			@stars_map.each do |x|
				@print_line << x[i]
			end
			puts @print_line
			@print_line = ""
		end
	end

	def search_rating(film_title)
		rating = Imdb::Search.new(film_title).movies.first.rating
		push_film_stars(rating.to_i)
	end


end

Rating.new('FilmsList.txt').print_stars
