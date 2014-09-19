require 'imdb'
require_relative 'Movie'
require_relative 'List'

class Rating
	def initialize (file)
		@stars_map = []   # Array of strings (1 per film) containing n-stars 
		@titles_list = List.new
		load_film_list(file)
	end

	def print_stars
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
		@titles_list.print
	end

	private
	def load_film_list(file) # for initializing ratings
		File.open(file) do |films|
			films.each do |film_title| 
				create_movie(film_title)
			end				
		end
	end

	def create_movie(film_title)
		movie = Movie.new(film_title)
		@stars_map << movie.push_film_stars
		@titles_list.add(film_title)
	end
end

r = Rating.new('FilmsList.txt')
r.print_stars
r.print_titles
