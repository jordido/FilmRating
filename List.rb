class List
	def initialize
		@list = []
	end

	def add(element)
		@list << element
	end

	def print
		@list.each.with_index do |element, index|
			puts (index + 1).to_s + ". " + element
		end
	end
end