require_relative '../converters/SDML_to_json_converter'

input_array = ARGV
if input_array.length > 2
    puts "Too many arguments. Expected 2, got #{input_array.length}"
elsif input_array.length < 2
    puts "Too few arguments. Expected 2, got #{input_array.length}"
end

in_file_path  = input_array[0]
out_file_path = input_array[1]

SDMLToJSON::convert_SDML_file_to_json(in_file_path, out_file_path)