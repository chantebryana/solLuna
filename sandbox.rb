table = 'Jan.       Feb.       Mar.       Apr.       May        June       July       Aug.       Sept.      Oct.       Nov.       Dec. 
Day Rise  Set  Rise  Set  Rise  Set  Rise  Set  Rise  Set  Rise  Set  Rise  Set  Rise  Set  Rise  Set  Rise  Set  Rise  Set  Rise  Set
    h m  h m   h m  h m   h m  h m   h m  h m   h m  h m   h m  h m   h m  h m   h m  h m   h m  h m   h m  h m   h m  h m   h m  h m
01  0750 1706  0735 1740  0659 1815  0607 1849  0522 1921  0453 1951  0455 2001  0519 1941  0550 1857  0620 1806  0655 1719  0730 1656
02  0739 1735  0700 1813  0614 1845  0526 1918  0456 1947  0453 2001  0515 1945  0546 1903  0617 1811  0650 1725  0727 1657  0749 1702
03  0738 1737             0613 1846  0524 1919  0455 1948  0454 2001  0516 1944  0547 1902  0618 1809  0652 1723  0728 1656  0749 1703
04  0737 1738             0611 1847  0523 1920  0454 1949  0454 2001  0517 1943  0548 1900  0619 1808  0653 1722  0729 1656  0749 1704
05  0736 1739             0609 1848             0454 1950             0518 1942  0549 1859             0654 1721             0750 1704'

#convert raw txt into array; each line is an array element
rawArr = table.split("\n")

#declare new hash variable
rawHash = Hash.new

#playing with .split(/ /)
#CE this looks like the workings of a solution!
=begin
e = []
rawArr.each do |value|
	value.split(/    /).each do |y|
		if y == ""
			e.push("0")
		else 
			y.split(" ").each do |z|
				e.push(z)
			end 
		end
	end
end
=end
#=begin
eHash = Hash.new
(1..5).each do |i|
	eHash[i] = []
end
print eHash
puts "\n\n"

#e = []
(3..7).each do |i|
	rawArr[i].split(/    /).each do |x|
		if x == ""
			eHash[i-2].push("0")
		else
			x.split(" ").each do |y|
				eHash[i-2].push(y)
			end
		end
	end
end
=begin
(rawArr[06].split(/    /)).each do |x|
	if x == ""
		eHash[4].push("0")
	else
		x.split(" ").each do |y|
			eHash[4].push(y)
		end
	end
end

(rawArr[07].split(/    /)).each do |x|
	if x == ""
		eHash[5].push("0")
	else
		x.split(" ").each do |y|
			eHash[5].push(y)
		end
	end
end
=end
eHash.each do |key, value|
	puts "#{key}: #{value}"
end

#=begin
#automatically inject each key and value from rawArr
#CE add some end-of-month logic here
#returns {"row1"=>["01", "0750"..."1656"], "row2"=>["02", "0750"...]}
(1..5).each {|x| rawHash["row"+x.to_s] = rawArr[x+2].split(" ")}

(1..5).each {|x| rawHash["row"+x.to_s] = []}

rawHash.each do |key,value|
	puts "#{key}: #{value}"
end