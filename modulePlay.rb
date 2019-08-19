require 'json'

module Play
	#fill rawHash with number keys and empty array values. 
	#executed within riseSetFromTable block
	#Returns {row1: [], row2: [] ... row 31: []}
	def hashSkelington (num1, num2) 
		hash = Hash.new
		((num1-2)..(num2-2)).each do |i|
			hash["row"+i.to_s] = []
		end
		return hash
	end 
	
	#Fill rawHash with rise/set times from rawArr. 
	#Empty slots (rows 29, 30, 31) will be filled with `false` (so that it'll fail an an 'if rawHash[i]' test)
	#Returns {row1: ["01", "0750"..."1656"] ... row31: ["31", "0736", "1739", false, false...]}
	def timesFromTable (num1, num2, arr)
		hash = Hash.new
		hash = hashSkelington num1, num2
		(num1..num2).each do |i|
			arr[i].split(/    /).each do |x|
				if x == ""
					hash["row"+(i-2).to_s].push(false)
				else
					x.split(" ").each do |y|
						hash["row"+(i-2).to_s].push(y)
					end
				end
			end
		end
		return hash
	end
	
	def digestTable (fileName) 
		#save passed argument to this variable table
		table = File.read(fileName)
		
		#convert raw txt into array; each line is an array element
		rawArr = table.split("\n")
		
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
		
		dst = dstParse 36, rawArr
		p dst
		
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

		dst_index = date_to_index dst
		puts dst_index
		
		#declare new hash variable
		rawHash = Hash.new

		#fill rawHash with number keys and empty array values. 
		#Returns {row1: [], row2: [] ... row 31: []}
		#rawHash = hashSkelington 1, 31

		#Fill rawHash with rise/set times from rawArr. 
		#Empty slots (rows 29, 30, 31) will be filled with `false` (so that it'll fail an an 'if rawHash[i]' test)
		#Returns {row1: ["01", "0750"..."1656"] ... row31: ["31", "0736", "1739", false, false...]}
		rawHash = timesFromTable 3, 33, rawArr

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
		
		return monthHash
	end 
end
