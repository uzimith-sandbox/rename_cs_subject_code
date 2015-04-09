require 'csv'
require 'json'

code_list = {}
Dir.glob("kdb*") do |kdb|
  table = CSV.parse(File.open(kdb).read.encode("UTF-8", "CP932"))

  table[2..-1].each do |row|
    code_list[row[0]] = row[1]
  end
end

open("code_list.json", "w") do |file|
  file.print code_list.to_json
end
