require 'json'

module PlayDst
	def digestTable (filename)
		#first, manually copy table data from html file to an appropriately named txt file. 
		#Then save it to this variable table
		table = File.read(filename)

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
		
		#CE play with dst, json parsing
		def dstParse (num, arr)
			rawDst = JSON.parse(arr[num])
			springDate = rawDst['springForward'].split("-")
			fallDate = rawDst['fallBack'].split("-")
			dstArr = []
			dstArr[0] = springDate[1].to_i
			dstArr[1] = springDate[2].to_i
			dstArr[2] = fallDate[1].to_i
			dstArr[3] = fallDate[2].to_i
			return dstArr
		end
		
		dstDate = dstParse 36, rawArr
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

		#separate method that adds 1 hour for dst 
		#(use in monthHash.each loop)
		#"0606" becomes "0706"
		def add_hour_dst(value)
			temp = 0
			temp = value.to_i
			temp += 100					# <-- add 1 hour for dst
			#reassign array value to dst timestamp:
			if temp < 1200			#<-- if sunrise (need to manually add "0" to int
				value = "0"+temp.to_s
			elsif								#<-- if sunset
				value = temp.to_s
			end
			return value
		end

		#accounting for dst (with if/else conditions)
		monthHash.each do |key, value|
			#if March
			if key == dst_index[0]
				#puts "conditional addition mar"
				value.each_with_index do |x, i|
					if x != false
						if i >= dst_index[1]
							monthHash[key][i] = add_hour_dst x
						end
					end
				end
			#if November
			elsif key == dst_index[2]
				#puts "conditional addition nov"
				value.each_with_index do |x, i|
					if x != false
						if i < dst_index[3]
							monthHash[key][i] = add_hour_dst x
						end
					end
				end
			#if Apr, May, Jun, Jul, Aug, Sep, or Oct
			elsif key > dst_index[0] && key < dst_index[2]
				#puts "add add baby"
				value.each_with_index do |x, i|
					if x != false
						monthHash[key][i] = add_hour_dst x
					end
				end
			else 
				#puts "do nothing"
			end
		end

		return monthHash
	end
end

#items for consideration: 
#  accounting for daylight savings time (do I need another table of dst dates?)
#  reading raw html file instead of manually-created text file?
#  whether to keep this data as a hash; to export it to txt / csv; or to import it into a database table?