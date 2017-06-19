require 'csv'
require 'find'

############################################################################
# VARIABLES
############################################################################

CMD = File.basename __FILE__

glob_pattern      = ENV['GLOB_PATTERN'] || '*.jpg'
recto_file_column = ENV['RECTO_FILE_COLUMN'] || 'recto_file'
verso_file_column = ENV['VERSO_FILE_COLUMN'] || 'verso_file'
output_file       = ENV['OUTPUT_FILE'] ||  File.join(Dir.pwd, 'output.csv')
column            = ENV['FOLDER_COLUMN'] || 'folder_base'

############################################################################
# METHODS
############################################################################
def usage
  $stderr.puts "Usage: #{CMD} SEARCH_DIRECTORY CSV_FILE"

  wd = `pwd`.strip
  $stderr.puts %Q{

The following values can be changed as environment variables:

  GLOB_PATTERN          default: '*.jpg'
  FILE_PATH_COLUMN      default: 'file_name'
  OUTPUT_FILE           default: '#{wd}/output.csv'
  FOLDER_COLUMN         default: 'folder_base'

}
end

def exit_with_error message
  $stderr.puts message
  $stderr.puts
  usage
  exit 1
end

############################################################################
# CAPTURE AND VALIDATE ARGUMENTS
############################################################################
unless ARGV.size == 2
  exit_with_error "ERROR: Wrong number of arguments."
end

directory, csv_file = ARGV

unless File.directory? directory
  exit_with_error "ERROR: SEARCH_DIRECTORY is not directory: #{directory}"
end

unless File.file? csv_file
  exit_with_error "ERROR: CSV_FILE is not a file: #{csv_file}"
end

# get this first row of the CSV, the headers
headers = CSV.open(csv_file, 'r') { |csv| csv.first }
headers << recto_file_column
headers << verso_file_column

unless headers.include? column
  exit_with_error "ERROR: CSV lacks FOLDER_COLUMN '#{column}'"
end

############################################################################
# DO THE STUFF
############################################################################

CSV.open output_file, 'wb' do |csv|
  csv << headers
  CSV.foreach csv_file, headers: true do |row|
    # get the expected folder name; 'h001', 'h002', etc.
    folder_base = row[column]

    # skip if column blank for this row
    if folder_base.nil? || folder_base.to_s.strip.empty?
      $stderr.puts "WARNING: No #{column} value for row #{$.}"
      next
    end

    # skip if directory doesn't exist
    the_dir = File.join(directory, folder_base)
    unless File.directory? the_dir
      $stderr.puts "WARNING: Could not find directory: '#{the_dir}'"
      next
    end

    # OK, the directory exists; get all the names. We assume the images are
    # recto and verson corresponding to even and odd indexes:
    #
    # data/HalperMaterial/h001/h001_wk1_body0001.jpg  recto  index 0
    # data/HalperMaterial/h001/h001_wk1_body0002.jpg  verso  index 1
    pairs = []
    Dir["#{the_dir}/#{glob_pattern}"].each_with_index do |image, i|
      if i.even?
        pairs << [image] # this is the recto; an new array
      else
        pairs.last << image # this is the recto; push onto last array
      end
    end

    pairs.each do |pair|
      # there's always a recto
      row << [recto_file_column, pair.first]
      # only get the verso when the array has two members
      row << [verso_file_column, pair.last] if pair.size == 2
      csv << headers.map { |h| row[h] }
    end
  end
end

$stderr.puts "Wrote '#{output_file}'"
