class Robot

	@@orientations = [:N, :E, :S, :W]

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

	def L
		index = @@orientations.index(@orient)
		@orient = @@orientations[index - 1]
	end

	#We can access arrays using negative indices, but not positive ones.
	#We have to make sure we're accessing the correct elements.
	def R
		index = @@orientations.index(@orient)
		index = (index + 1) % @@orientations.size
		@orient = @@orientations[index]
	end

	def F
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
			if !@grid.scented?(@x, @y)
				@grid.mark_scent(@x, @y)
				@lost = true
			end
			return
		end

		@x = new_x
		@y = new_y
	end

end