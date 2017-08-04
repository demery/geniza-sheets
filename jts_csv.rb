#!/usr/bin/env ruby

require 'set'
require 'csv'
require 'optparse'

SKIPS = %w{
  ENA_2947_00001.tif.jpg
  ENA_2947_00002.tif.jpg
  ENA_2947_00003.tif.jpg
  ENA_2947_00004.tif.jpg
  ENA_2947_00005.tif.jpg
  ENA_2947_00006.tif.jpg
  ENA_2947_00007.tif.jpg
  ENA_2947_00008.tif.jpg
  ENA_2947_00009.tif.jpg
  ENA_2947_00010.tif.jpg
  ENA_2947_00011.tif.jpg
  ENA_2947_00012.tif.jpg
  ENA_3385_001_r_1.tif.jpg
  ENA_3385_001_r_2.tif.jpg
  ENA_3385_001_v_1.tif.jpg
  ENA_3385_001_v_2.tif.jpg
  ENA_10808_TARGET.tif.jpg
  ENA_2857_tocontinue.tif.jpg
  ENA_NS_76_vol_1_0054_r_1st.tif.jpg
  ENA_NS_76_vol_1_0054_r_2nd.tif.jpg
  ENA_NS_76_vol_1_0054_v_1st.tif.jpg
  ENA_NS_76_vol_1_0054_v_2nd.tif.jpg
  ENA_NS_76_vol_2_0314_r_1st.tif.jpg
  ENA_NS_76_vol_2_0314_r_2nd.tif.jpg
  ENA_NS_76_vol_2_0314_v_1st.tif.jpg
  ENA_NS_76_vol_2_0314_v_2nd.tif.jpg
  ENA_NS_76_vol_2_0437_r_1st.tif.jpg
  ENA_NS_76_vol_2_0437_r_2nd.tif.jpg
  ENA_NS_76_vol_2_0437_v_1st.tif.jpg
  ENA_NS_76_vol_2_0437_v_2nd.tif.jpg
  ENA_NS_76_vol_3_0578_r_1st.tif.jpg
  ENA_NS_76_vol_3_0578_r_2nd.tif.jpg
  ENA_NS_76_vol_3_0578_v_1st.tif.jpg
  ENA_NS_76_vol_3_0578_v_2nd.tif.jpg
  ENA_NS_79_vol_1_0200_r_1st.tif.jpg
  ENA_NS_79_vol_1_0200_r_2nd.tif.jpg
  ENA_NS_79_vol_1_0200_v_1st.tif.jpg
  ENA_NS_79_vol_1_0200_v_2nd.tif.jpg
  ENA_NS_79_vol_1_0221_r_1st.tif.jpg
  ENA_NS_79_vol_1_0221_r_2nd.tif.jpg
  ENA_NS_79_vol_1_0221_v_1st.tif.jpg
  ENA_NS_79_vol_1_0221_v_2nd.tif.jpg
  ENA_NS_79_vol_1_0222_r_1st.tif.jpg
  ENA_NS_79_vol_1_0222_r_2nd.tif.jpg
  ENA_NS_79_vol_1_0222_v_1st.tif.jpg
  ENA_NS_79_vol_1_0222_v_2nd.tif.jpg
  ENA_NS_79_vol_1_0231_r_1st.tif.jpg
  ENA_NS_79_vol_1_0231_r_2nd.tif.jpg
  ENA_NS_79_vol_1_0231_v_1st.tif.jpg
  ENA_NS_79_vol_1_0231_v_2nd.tif.jpg
  ENA_NS_79_vol_5_0876_r_1st.tif.jpg
  ENA_NS_79_vol_5_0876_r_2nd.tif.jpg
  ENA_NS_79_vol_5_0876_v_1st.tif.jpg
  ENA_NS_79_vol_5_0876_v_2nd.tif.jpg
  ENA_NS_79_vol_5_0896_r_1st.tif.jpg
  ENA_NS_79_vol_5_0896_r_2nd.tif.jpg
  ENA_NS_79_vol_5_0896_v_1st.tif.jpg
  ENA_NS_79_vol_5_0896_v_2nd.tif.jpg
  ENA_NS_79_vol_5_0897_r_1st.tif.jpg
  ENA_NS_79_vol_5_0897_r_2nd.tif.jpg
  ENA_NS_79_vol_5_0897_v_1st.tif.jpg
  ENA_NS_79_vol_5_0897_v_2nd.tif.jpg
  ENA_NS_79_vol_6_1018_r_1st.tif.jpg
  ENA_NS_79_vol_6_1018_r_2nd.tif.jpg
  ENA_NS_79_vol_6_1018_v_1st.tif.jpg
  ENA_NS_79_vol_6_1018_v_2nd.tif.jpg
  ENA_NS_79_vol_7_1085_r_1st.tif.jpg
  ENA_NS_79_vol_7_1085_r_2nd.tif.jpg
  ENA_NS_79_vol_7_1085_v_1st.tif.jpg
  ENA_NS_79_vol_7_1085_v_2nd.tif.jpg
  ENA_NS_79_vol_7_1087_r_1st.tif.jpg
  ENA_NS_79_vol_7_1087_r_2nd.tif.jpg
  ENA_NS_79_vol_7_1087_v_1st.tif.jpg
  ENA_NS_79_vol_7_1087_v_2nd.tif.jpg
  ENA_NS_79_vol_7_1088_r_1st.tif.jpg
  ENA_NS_79_vol_7_1088_r_2nd.tif.jpg
  ENA_NS_79_vol_7_1088_v_1st.tif.jpg
  ENA_NS_79_vol_7_1088_v_2nd.tif.jpg
  ENA_NS_79_vol_7_1089_r_1st.tif.jpg
  ENA_NS_79_vol_7_1089_r_2nd.tif.jpg
  ENA_NS_79_vol_7_1089_v_1st.tif.jpg
  ENA_NS_79_vol_7_1089_v_2nd.tif.jpg
  ENA_NS_79_vol_7_1093_r_1st.tif.jpg
  ENA_NS_79_vol_7_1093_r_2nd.tif.jpg
  ENA_NS_79_vol_7_1093_v_1st.tif.jpg
  ENA_NS_79_vol_7_1093_v_2nd.tif.jpg
  ENA_NS_79_vol_7_1094_r_1st.tif.jpg
  ENA_NS_79_vol_7_1094_r_2nd.tif.jpg
  ENA_NS_79_vol_7_1094_r_3rd.tif.jpg
  ENA_NS_79_vol_7_1094_r_4th.tif.jpg
  ENA_NS_79_vol_7_1094_v_1st.tif.jpg
  ENA_NS_79_vol_7_1094_v_2nd.tif.jpg
  ENA_NS_79_vol_7_1094_v_3rd.tif.jpg
  ENA_NS_79_vol_7_1094_v_4th.tif.jpg
  ENA_NS_79_vol_7_1113_r_1st.tif.jpg
  ENA_NS_79_vol_7_1113_r_2nd.tif.jpg
  ENA_NS_79_vol_7_1113_v_1st.tif.jpg
  ENA_NS_79_vol_7_1113_v_2nd.tif.jpg
  ENA_NS_79_vol_7_1121_r_1st.tif.jpg
  ENA_NS_79_vol_7_1121_r_2nd.tif.jpg
  ENA_NS_79_vol_7_1121_r_3rd.tif.jpg
  ENA_NS_79_vol_7_1121_r_4th.tif.jpg
  ENA_NS_79_vol_7_1121_v_1st.tif.jpg
  ENA_NS_79_vol_7_1121_v_2nd.tif.jpg
  ENA_NS_79_vol_7_1121_v_3rd.tif.jpg
  ENA_NS_79_vol_7_1121_v_4th.tif.jpg
  ENA_NS_79_vol_7_1122_r_1st.tif.jpg
  ENA_NS_79_vol_7_1122_r_2nd.tif.jpg
  ENA_NS_79_vol_7_1122_v_1st.tif.jpg
  ENA_NS_79_vol_7_1122_v_2nd.tif.jpg
  ENA_NS_79_vol_7_1124_r_1st.tif.jpg
  ENA_NS_79_vol_7_1124_r_2nd.tif.jpg
  ENA_NS_79_vol_7_1124_v_1st.tif.jpg
  ENA_NS_79_vol_7_1124_v_2nd.tif.jpg
  ENA_NS_81_0054_r_1st.tif.jpg
  ENA_NS_81_0054_r_2nd.tif.jpg
  ENA_NS_81_0054_v_1st.tif.jpg
  ENA_NS_81_0054_v_2nd.tif.jpg
  ENA_NS_83_vol_2_0220_r_1st.tif.jpg
  ENA_NS_83_vol_2_0220_r_2nd.tif.jpg
  ENA_NS_83_vol_2_0220_v_1st.tif.jpg
  ENA_NS_83_vol_2_0220_v_2nd.tif.jpg
  ENA_NS_83_vol_3_0374.1_r_1st.tif.jpg
  ENA_NS_83_vol_3_0374.1_r_2nd.tif.jpg
  ENA_NS_83_vol_3_0374.1_v_1st.tif.jpg
  ENA_NS_83_vol_3_0374.1_v_2nd.tif.jpg
  ENA_NS_85_vol_1_0149_r_1st.tif.jpg
  ENA_NS_85_vol_1_0149_r_2nd.tif.jpg
  ENA_NS_85_vol_1_0149_v_1st.tif.jpg
  ENA_NS_85_vol_1_0149_v_2nd.tif.jpg
  ENA_NS_76_vol_3_500_503_v.tif.jpg
  ENA_NS_76_vol_3_504_505_v.tif.jpg
  ENA_NS_77_vol_5_0800.2._v.tif.jpg
  ENA_NS_79_vol_3_0380.1-0380.3_r.tif.jpg
  ENA_NS_79_vol_3_0380.1-0380.3_v.tif.jpg
  ENA_NS_79_vol_4_0622.1-0622.2_r.tif.jpg
  ENA_NS_79_vol_4_0622.1-0622.2_v.tif.jpg
  MS_L_273_0002_r_1st.tif.jpg
  MS_L_273_0002_r_2nd.tif.jpg
  MS_L_273_0002_r_3rd.tif.jpg
  MS_L_273_0002_r_4th.tif.jpg
  MS_L_273_0002_v_1st.tif.jpg
  MS_L_273_0002_v_2nd.tif.jpg
  MS_L_273_0002_v_3rd.tif.jpg
  MS_L_273_0002_v_4th.tif.jpg
  MS_L_273_0003_r_1st.tif.jpg
  MS_L_273_0003_r_2nd.tif.jpg
  MS_L_273_0003_r_3rd.tif.jpg
  MS_L_273_0003_r_4th.tif.jpg
  MS_L_273_0003_v_1st.tif.jpg
  MS_L_273_0003_v_2nd.tif.jpg
  MS_L_273_0003_v_3rd.tif.jpg
  MS_L_273_0003_v_4th.tif.jpg
  MS_L_273_0004_r_1st.tif.jpg
  MS_L_273_0004_r_2nd.tif.jpg
  MS_L_273_0004_r_3rd.tif.jpg
  MS_L_273_0004_r_4th.tif.jpg
  MS_L_273_0004_v_1st.tif.jpg
  MS_L_273_0004_v_2nd.tif.jpg
  MS_L_273_0004_v_3rd.tif.jpg
  MS_L_273_0004_v_4th.tif.jpg
  MS_L_273_0005_r_1st.tif.jpg
  MS_L_273_0005_r_2nd.tif.jpg
  MS_L_273_0005_v_1st.tif.jpg
  MS_L_273_0005_v_2nd.tif.jpg
}

options = {}
OptionParser.new do |opts|
  opts.banner = "Usage: #{File.basename __FILE__} [options] INPUT_FILE"

  opts.on "-v", "--[no-]verbose", "Run verbosely" do |v|
    options[:verbose] = v
  end

  opts.on "-g", "--list-glob-bases", "List all call numbers found (CSV not generated)" do |g|
    options[:list_globs] = g
  end

  opts.on "-o", "--output FILE", "Output to FILE" do |o|
    options[:output_file] = o
  end

  opts.on("-h", "--help", "Prints this help") do
    puts opts
    exit
  end
end.parse!

# puts options
# exit

output_file = options[:output_file] || 'output.csv'

input_file = ARGV.shift

File.exists? "#{input_file}" or fail "Not a valid input file: '#{input_file}'"

def get_mark fname
  base = fname.chomp '.tif.jpg'

  parts = base.split(/_/)
  case base
  when /^ENA_\d+_\d+[ab]?_[rv]$/, /^ENA_\d+_\d+$/, /^MS_\d+/, /^MS_L\d+/, /^MS_R\d+/, /^NS_\d+/
    parts[0,2].join '_'
  when /^ENA_\d+_[A-B]_\d+$/
    parts[0,3].join '_'
  when /^ENA_NS_\d+_\d+_[rv]$/, /^ENA_NS_\d+_\d+\.\d+_[rv]$/
    # ENA_NS_10_003_r
    # ENA_NS_82_0024.2_v.tif.jpg
    parts[0,4].join '_'
  when /^ENA_NS_\d+_vol_\d+_\d+_[rv]$/, /^ENA_NS_\d+_vol_\d+_\d+\.\d+_[rv]$/, /^ENA_NS_\d+_vol_\d+_\d+\.\d+\.\d+_[rv]$/
    # ENA_NS_85_vol_3_1352_v
    # ENA_NS_85_vol_3_1356.2_r
    # ENA_NS_77_vol_4_0494.10.1_r.tif.jpg
    # ENA_NS_77_vol_4_0494.10.1_r.tif.jpg
    parts[0,6].join '_'
  when /^ENA_NS_\d+_vol_\d+_part_\d+_\d+_[rv]$/, /^ENA_NS_\d+_vol_\d+_part_\d+_\d+\.\d_[rv]$/
    # ENA_NS_85_vol_3_part_2_1509_r
    # ENA_NS_85_vol_3_part_2_1508.2_v
    parts[0,8].join '_'
  when /^MS_L_\d+/
    parts[0,3].join '_'
  else
    STDERR.puts "Can't process mark for #{fname.strip}"
  end
end

def skip? fname
  SKIPS.include? fname
end

def display_mark mark_name
  mark_name.sub(/_vol_\d+/, '').sub(/_part_\d+/, '').gsub(/_/, ' ')
end

filenames = open(input_file).readlines.map(&:strip).reject { |fname|
 skip?(fname)
}

# Extract the list of shelf marks from the list of input files. Sort them by
# length, longest first. Thus we avoid unwanted substring matches. See below.
marks = filenames.reduce(Set.new) { |mark_set, fname|
  mark_set << get_mark(fname)
}.to_a.sort { |a, b| b.to_s.size <=> a.to_s.size }

if options[:list_globs]
  puts marks
  exit
end

CSV.open output_file, 'wb' do |csv|
  csv << ["call_number", "file1", "file2" ]
  marks.each do |mark|
    human_mark = display_mark mark
    filenames.grep(/^#{mark}/).sort.each_slice(2) do |r,v|
      row = [ human_mark, r, v ]
      csv << row

      # Remove each used filename from the list. This way, the grep above
      # won't catch unwanted substring matches on subsquent, shorter marks.
      # E.g., this file name
      #
      #   ENA_NS_77_vol_4_0494.10.1_r.tif.jpg
      #
      # Matches both of these mark patterns
      #
      #    /ENA_NS_77_vol_4_0494\.10/
      #    /ENA_NS_77_vol_4_0494/
      #
      # The marks are ordered so that we try the long value first. After
      # they're used the files matching each pattern are removed from the
      # filenames array. Thus, if a shorter pattern is used later, those files
      # will not be matched a second time.
      filenames.delete r
      filenames.delete v unless v.to_s.empty?
    end
  end
end

STDERR.puts "Wrote #{output_file}"