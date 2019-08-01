module Play
	def digestTable (fileName) 
		#save passed argument to this variable table
		table = File.read(fileName)
		
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
		
		return rawHash
	end 
end
