#tsv_to_yaml.rb

#output file nil?
outname = $stdin.gets.chomp if ARGV[1].nil?
outname = ARGV[1] unless ARGV[1].nil?

#take content from tsv
require 'yaml'
yaml_array = []
box = []
tsv_file = File.open(ARGV[0],'r')
tsv_file.each_line {|line| box << line}
tsv_file.close

#clean the box
keys = box[0].split("\t")
keys.map!{|x| x.chomp}
box.shift
box.each do |line|
	values = line.split("\t")
	new_yaml = Hash.new
	keys.each_index { |index| new_yaml[keys[index]] = values[index].chomp }
	yaml_array.push(new_yaml)
end

# Serialize the data
File.open(outname, 'w') do |file|
  file.puts yaml_array.to_yaml
end



