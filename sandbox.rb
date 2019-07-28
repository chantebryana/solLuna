=begin
#first, manually copy table data from html file to an appropriately named txt file. 
#Then save it to this variable table
table = File.read("sunrisesunset2020.txt")
#quick and dirty daylight savings time array from wikipedia
#note: DST goes into effect on-the-day at 2am
dst = ["2019-03-10", "2019-11-03", "2020-03-08", "2020-11-01", "2021-03-14", "2021-11-07"]

#convert raw txt into array; each line is an array element
rawArr = table.split("\n")

#declare new hash variable
rawHash = Hash.new

#fill rawHash with number keys and empty array values. 
#Returns {row1: [], row2: [] ... row 31: []}
(1..31).each do |i|
	rawHash["row"+i.to_s] = []
end

#Fill rawHash with rise/set times from rawArr. 
#Empty slots (rows 29, 30, 31) will be filled with `false` (so that it'll fail an an 'if rawHash[i]' test)
#Returns {row1: ["01", "0750"..."1656"] ... row31: ["31", "0736", "1739", false, false...]}
(3..33).each do |i|
	rawArr[i].split(/    /).each do |x|
		if x == ""
			rawHash["row"+(i-2).to_s].push(false)
		else
			x.split(" ").each do |y|
				rawHash["row"+(i-2).to_s].push(y)
			end
		end
	end
end

#grab months from rawArr
#returns ["Jan.", "Feb." ... "Dec."]
months = rawArr[0].split(" ")

#declare new hash variable
monthHash = Hash.new

#automatically populate monthHash keys with month names from table
#returns {"Jan."=>[], "Feb."=>[] ... "Dec."=>[]}
months.each {|x| monthHash[x] = []}

#create an array with each month listed twice: 
#this will help for the rawHash loop further down 
#(provide two month indices to match up with two time values)
#returns ["Jan.", "Jan.", "Feb.", "Feb." ... "Dec.", "Dec."]
monthDoubleIndex = []
months.each do |x|
	monthDoubleIndex.push(x)
	monthDoubleIndex.push(x)
end

#fully-automated loop that injects each month's data from rawHash
rawHash.each do |key, value|
	value[1..-1].each_with_index do |v, i|
		monthHash[(monthDoubleIndex[i])].push(v)
	end
end

#CE playing in the mud
#set variable for quick-and-dirty daylight savings time
#begins when value is >= index
#lasts while value is < index
dst_raw = ["Mar.", 10, "Nov.", 3]
#convert raw dst date numbers into the correct index 
#to use when searching through monthHash
#ex: ["Mar.", 10, "Nov.", 3] becomes ["Mar.", 18, "Nov.", 4]
def date_to_index (array)
	a = []
	array.each_with_index do |x, i|
		if i % 2 == 1
			a.push((x*2)-2)
		else
			a.push(x)
		end
	end
	return a
end
dst_index = date_to_index dst_raw

#display monthHash+dst to console
monthHash.each do |key, value|
	if key == dst_index[0]
		value.each_with_index do |v,i|
			if i == dst_index[1]
				#v.to_i += 100
				puts "#{key} #{v}"
				puts "\n"
			end
		end
	elsif key == dst_index[2]
		value.each_with_index do |v,i|
			if i == dst_index[3]
				#v.to_i += 100
				puts "#{key} #{v}"
				puts "\n"
			end
		end
	end
end


#items for consideration: 
#  accounting for daylight savings time (do I need another table of dst dates?)
#  reading raw html file instead of manually-created text file?
#  whether to keep this data as a hash; to export it to txt / csv; or to import it into a database table?

=end



#first, manually copy table data from html file to an appropriately named txt file. 
#Then save it to this variable table
table = File.read("sunrisesunset2020.txt")

#convert raw txt into array; each line is an array element
rawArr = table.split("\n")

#declare new hash variable
rawHash = Hash.new

#fill rawHash with number keys and empty array values. 
#Returns {row1: [], row2: [] ... row 31: []}
(1..31).each do |i|
	rawHash["row"+i.to_s] = []
end

#Fill rawHash with rise/set times from rawArr. 
#Empty slots (rows 29, 30, 31) will be filled with `false` (so that it'll fail an an 'if rawHash[i]' test)
#Returns {row1: ["01", "0750"..."1656"] ... row31: ["31", "0736", "1739", false, false...]}
(3..33).each do |i|
	rawArr[i].split(/    /).each do |x|
		if x == ""
			rawHash["row"+(i-2).to_s].push(false)
		else
			x.split(" ").each do |y|
				rawHash["row"+(i-2).to_s].push(y)
			end
		end
	end
end

#declare new hash variable
monthHash = Hash.new

#automatically populate monthHash keys with numbers for month keys
#using numbered keys will help with dst logic 
#returns {1=>[], 2=>[] ... 12=>[]}
(1..12).each {|i| monthHash[i] = []}

#create an array with each month listed twice: 
#this will help for the rawHash loop further down 
#(provide two month indices to match up with two time values)
#returns [1,1,2,2...12,12]
monthDoubleIndex = []
#months.each do |x|
(1..12).each do |x|
	monthDoubleIndex.push(x)
	monthDoubleIndex.push(x)
end

#fully-automated loop that injects each month's data from rawHash
rawHash.each do |key, value|
	value[1..-1].each_with_index do |v, i|
		monthHash[(monthDoubleIndex[i])].push(v)
	end
end

#CE playing in the mud
#set variable for quick-and-dirty daylight savings time
dst_raw = [3, 10, 11, 3]
#convert raw dst date numbers into the correct index 
#to use when searching through monthHash
#ex: [3, 10, 11, 3] becomes [3, 18, 11, 4]
def date_to_index (array)
	a = []
	array.each_with_index do |x, i|
		if i % 2 == 1
			a.push((x*2)-2)
		else
			a.push(x)
		end
	end
	return a
end
dst_index = date_to_index dst_raw

monthHash.each do |key, value|
	temp = 0
	if key == dst_index[0] || key == dst_index[2]
		puts "conditional addition"
		#puts value
	elsif key > dst_index[0] || key < dst_index[2]
		puts "add add baby"
		if value == true
			temp = value.to_i
			temp =+ 100
			value = "0"+temp
		end
	end
end
#=begin
#display monthHash to console
monthHash.each do |key, value|
  puts "#{key} #{value}"
  puts "\n"
end
#=end
=begin
#display monthHash+dst to console
monthHash.each do |key, value|
	if key == dst_index[0]
		value.each_with_index do |v,i|
			if i == dst_index[1]
				#v.to_i += 100
				puts "#{key} #{v}"
				puts "\n"
			end
		end
	elsif key == dst_index[2]
		value.each_with_index do |v,i|
			if i == dst_index[3]
				#v.to_i += 100
				puts "#{key} #{v}"
				puts "\n"
			end
		end
	end
end
=end

#items for consideration: 
#  accounting for daylight savings time (do I need another table of dst dates?)
#  reading raw html file instead of manually-created text file?
#  whether to keep this data as a hash; to export it to txt / csv; or to import it into a database table?