table = 'Jan.       Feb.       Mar.       Apr.       May        June       July       Aug.       Sept.      Oct.       Nov.       Dec. 
Day Rise  Set  Rise  Set  Rise  Set  Rise  Set  Rise  Set  Rise  Set  Rise  Set  Rise  Set  Rise  Set  Rise  Set  Rise  Set  Rise  Set
    h m  h m   h m  h m   h m  h m   h m  h m   h m  h m   h m  h m   h m  h m   h m  h m   h m  h m   h m  h m   h m  h m   h m  h m
01  0750 1706  0735 1740  0659 1815  0607 1849  0522 1921  0453 1951  0455 2001  0519 1941  0550 1857  0620 1806  0655 1719  0730 1656
02  0750 1706  0734 1742  0657 1816  0606 1850  0520 1922  0453 1951  0455 2001  0520 1940  0551 1855  0622 1804  0656 1718  0731 1655
03  0750 1707  0733 1743  0656 1817  0604 1851  0519 1923  0453 1952  0456 2000  0521 1939  0552 1854  0623 1803  0657 1717  0732 1655'

#organizes each row into its relevant hash value
rawArr = table.split("\n")

#declare hash variable
rawHash = Hash.new

#manually inject each row from table
rawHash["row1"] = rawArr[3].split(" ")
rawHash["row2"] = rawArr[4].split(" ")
rawHash["row3"] = rawArr[5].split(" ")

#declare hash variables
monthHash = Hash.new
monthHash["Jan."] = []
monthHash["Feb."] = []
monthHash["Mar."] = []

#CE working on this right now
#semi-automatically inject each month from rawHash
rawHash.each do |row, arr|
  a = []
  b = []
  c = []
  arr[1..-1].each_with_index do |v,i|
    if i == 0 or i == 1
      a.push(v)
	  if a.length == 2
	    monthHash["Jan."].push(a)
	  end
    elsif i == 2 or i == 3
	  b.push(v)
	  if b.length == 2
	    monthHash["Feb."].push(b)
	  end
	  
	elsif i == 4 or i == 5
	  c.push(v)
	  if c.length == 2
	    monthHash["Mar."].push(c)
	  end
	end
  end
end

puts(monthHash)
