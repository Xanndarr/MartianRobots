class Robot

	attr_reader :x, :y, :orent

	def initialize(x, y, orient)
		@x = x
		@y = y
		@orient = orient
		@lost = false
	end

	def lost?
		@lost
	end

end