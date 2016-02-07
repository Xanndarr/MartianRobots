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

	def oob?(x, y)
		return x >= 0 && x <= @x_bound && y >= 0 && y <= @y_bound
	end

end