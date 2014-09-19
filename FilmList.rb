class FilmList
	def initialize
		@list = []
	end

	def add(title)
		@list << title
	end

	def print
		index = 1
		@list.each do |title|
			puts index.to_s + ". " + title
			index += 1
		end
	end
end