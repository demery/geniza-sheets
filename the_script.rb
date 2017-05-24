require 'csv'
require 'find'

CMD = File.basename __FILE__

def usage
  puts "Usage: #{CMD} SEARCH_DIRECTORY CSV_FILE COLUMN"
end

def exit_with_error message
  puts message
  puts
  usage
  exit 1
end

unless ARGV.size == 3
  exit_with_error "Wrong number of arguments."
end

directory, csv_file, column = ARGV

unless File.directory? directory
  exit_with_error "SEARCH_DIRECTORY is not directory: #{directory}"
end

unless File.file? csv_file
  exit_with_error "CSV_FILE is not a file: #{csv_file}"
end

headers = CSV.open(csv_file, 'r') { |csv| csv.first }
headers << 'file_name'

CSV.open 'output.csv', 'wb' do |csv|
  csv << headers
  CSV.foreach csv_file, headers: true do |row|
    folder_base = row[column]
    next if folder_base.nil? || folder_base.to_s.strip.empty?
    the_dir = File.join(directory, folder_base)
    unless File.directory? the_dir
      $stderr.puts "WARNING: could not find directory: #{the_dir}"
      next
    end
    Dir["#{the_dir}/*.tif"].each do |tiff|
      row << ['file_name', tiff]
      new_row = headers.map { |h| row[h] }
      csv << new_row
    end
  end
end
