require 'imdb'
require_relative 'Movie'

class Rating
	def initialize (file)
		@file = file
		@stars_map = []   # Array of strings (1 per film) containing n-stars 
		@list_of_films = []
		load_film_list
	end

	def load_film_list # for initializing ratings
		File.open(@file) do |films|
				films.each do |film_title| 
					create_movie(film_title)
				end
				
		end
	end

	def create_movie(film_title)
		movie = Movie.new(film_title)
		@stars_map << movie.push_film_stars
		@list_of_films <<  film_title # OR film_title directly
	end

	def print_stars
		print_line = ""
		for i in 9.downto 0
			print_stars_line(i)
		end
	end

	def print_stars_line(index)
		print_line = ""
		@stars_map.each do |x|
				print_line << x[index].to_s		# build a line to be printed, containing the i element of each stars_map line
		end
		puts print_line			# this is the output
	end
			
	def print_titles
		index = 1
		@list_of_films.each do |title|
			puts index.to_s + ". " + title
			index += 1
		end
	end

end

R =Rating.new('FilmsList.txt')
R.print_stars
R.print_titles
