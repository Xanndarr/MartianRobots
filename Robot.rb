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

	def left
		case @orient
		when :N
			@orient = :W
		when :E
			@orient = :N
		when :S
			@orient = :E
		when :W
			@orient = :S
		end
	end

	def right
		case @orient
		when :N
			@orient = :E
		when :E
			@orient = :S
		when :S
			@orient = :W
		when :W
			@orient = :N
		end
	end

	def forward
		case @orient
		when :N
			y += 1
		when :E
			x += 1
		when :S
			y -= 1
		when :W
			x -= 1
		end
		#TODO: Add oob checks and scenting
	end

end