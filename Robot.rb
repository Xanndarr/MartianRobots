require_relative "Grib.rb"

class Robot

	attr_reader :x, :y, :orient

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
		return if @lost

		new_x = @x
		new_y = @y

		case @orient
		when :N
			new_y += 1
		when :E
			new_x += 1
		when :S
			new_y -= 1
		when :W
			new_x -= 1
		end

		if @grid.oob?(new_x, new_y)
			if @grid.scented?(new_x, new_y)
				return
			else
				@grid.mark_scent(new_x, new_y)
				@lost = true
			end
		end
		
		@x = new_x
		@y = new_y
	end

end