class Robot

	attr_reader :x, :y, :orent

	def initialize(x, y, orient, grid)
		@x = x
		@y = y
		@orient = orient
		@grid = grid
		@lost = false
	end

	def lost?
		@lost
	end

end