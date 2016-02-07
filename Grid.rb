class Grid

	def initialize(x_bound, y_bound)
		@x_bound = x_bound
		@y_bound = y_bound
		@scented = Hash.new(false)
	end

	def mark_scent(x, y)
		@scented = {[x, y] => true}
	end

	def scented?(x, y)
		@scented[[x, y]]
	end

end