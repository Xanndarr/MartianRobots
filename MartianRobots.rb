require_relative "Grid.rb"
require_relative "Robot.rb"
require_relative "Instruction.rb"

puts "=== Welcome to the martian robot simulator! ==="
puts "===             by Tom Barwick              ==="

if ARGV.size == 0
	puts "Usage: ruby MartianRobots.rb {input file}"
	exit
end

input_file = ARGV[0]
DEBUG = ARGV[1] == "DEBUG"								#allows output of debug info

if !File.exists?(input_file)
	puts "Invalid input file"
	exit
end

puts "INPUT: "
#Parse and make sense of our input.
lines = File.readlines input_file						#parse lines from file
lines.map! { |line| line.chomp.strip }					#clean input
lines.reject! { |line| line.empty? }					#remove blank lines

grid_dims = lines[0].split(" ").map! { |x| x.to_i }		#parse grid co-ords from first line

grid = Grid.new(grid_dims[0], grid_dims[1])
puts "New grid created with dimensions [#{grid_dims[0]}, #{grid_dims[1]}]"

#Create our new robots and send them on a mission.
robots = Array.new
lines[1..lines.size].each_slice(2) do |state, instr|
	state = state.split
	x = state[0].to_i
	y = state[1].to_i
	orient = state[2].to_sym

	r = Robot.new(x, y, orient, grid)
	robots << r
	puts "New robot created at (#{x}, #{y}) facing #{orient}"

	puts instr if DEBUG
	Instruction.new(instr).run(r)
end

puts "OUTPUT: "
output_file = "simulation.out"
File.open(output_file, "w") do |file|
	robots.each do |r|
		puts "Robot ended at (#{r.x}, #{r.y}) facing #{r.orient} #{" LOST" if r.lost?}"
		file.write("#{r.x} #{r.y} #{r.orient}#{" LOST" if r.lost?}\n")
	end
end

puts "Sample output can be found in #{output_file}"

#DEBUG info:
p lines if DEBUG
p grid_dims if DEBUG