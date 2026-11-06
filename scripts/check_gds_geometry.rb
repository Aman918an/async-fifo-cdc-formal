# Counts the shapes present on each layer in the GDS file.
# Usage: Set the GDS_FILE environment variable before running.

gds_file = ENV["GDS_FILE"]

unless gds_file && File.file?(gds_file)
  abort "Error: Set GDS_FILE to the path of a valid GDS file."
end

layout = RBA::Layout.new
layout.read(gds_file)

puts "===== GDS GEOMETRY COUNTS ====="

layout.layer_indices.each do |index|
  info = layout.get_info(index)
  count = 0

  layout.each_cell do |cell|
    count += cell.shapes(index).size
  end

  puts "#{info.layer}/#{info.datatype}: #{count} shapes"
end
