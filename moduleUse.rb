require './modulePlay'
include Play

table2019 = Play.digestTable("sunrisesunset2019.txt")
#display table2019 to console
table2019.each do |key, value|
  puts "#{key} #{value}"
  puts "\n"
end


=begin
table2020 = Play.digestTable("sunrisesunset2020.txt")

#display table2020 to console
table2020.each do |key, value|
  puts "#{key} #{value}"
  puts "\n"
end
=end