# Displays the GDS layer table with internal layer indices.
# Usage: Set the GDS_FILE environment variable before running.

gds_file = ENV["GDS_FILE"]

unless gds_file && File.file?(gds_file)
  abort "Error: Set GDS_FILE to the path of a valid GDS file."
end

layout = RBA::Layout.new
layout.read(gds_file)

layout.layer_indices.each do |index|
  info = layout.get_info(index)
  puts "#{index}: #{info.layer}/#{info.datatype}"
end
