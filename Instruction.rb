class Instruction

	def initialize(instr)
		@instr = instr
	end

	def run(robot)
		commands = @instr.split("").map { |i| i.to_sym }
		commands.each do |i|
			robot.method(i).call
		end
	end

end