class Instruction

	def initialize(instr)
		@instr = instr
	end

	def run(robot)
		commands = @instr.split("").map { |i| i.to_sym }
		commands.each do |i|
			case i
			when :L
				robot.left
			when :R
				robot.right
			when :F
				robot.forward
			end
		end
	end

end