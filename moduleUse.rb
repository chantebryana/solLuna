require './moduleDst'
include PlayDst

table2019 = PlayDst.digestTable("sunrisesunset2019.txt")
#display table2019 to console
table2019.each do |key, value|
  puts "#{key} #{value}"
  puts "\n"
end


#=begin
table2020 = PlayDst.digestTable("sunrisesunset2020.txt")

#display table2020 to console
table2020.each do |key, value|
  puts "#{key} #{value}"
  puts "\n"
end
#=end

#json parsing info https://rubyinrails.com/2014/04/20/ruby-read-json-file-to-hash/