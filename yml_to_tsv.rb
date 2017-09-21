
outname = $stdin.gets.chomp if ARGV[1].nil?
outname = ARGV[1]

require 'yaml'
origin_file = YAML.load(File.read(ARGV[0]))

# Create the TSV file
my_hash = origin_file[0]
keys_array = my_hash.keys
line = ''
keys_array.each { |key| line.concat(key + "\t") }
File.open(outname, 'w') do |file|
  file.puts line
  origin_file.each do |record|
    record.each_value { |value| file << value + "\t" }
    file << "\n"
  end
end
