table = 'Jan.       Feb.       Mar.       Apr.       May        June       July       Aug.       Sept.      Oct.       Nov.       Dec. 
Day Rise  Set  Rise  Set  Rise  Set  Rise  Set  Rise  Set  Rise  Set  Rise  Set  Rise  Set  Rise  Set  Rise  Set  Rise  Set  Rise  Set
    h m  h m   h m  h m   h m  h m   h m  h m   h m  h m   h m  h m   h m  h m   h m  h m   h m  h m   h m  h m   h m  h m   h m  h m
01  0750 1706  0735 1740  0659 1815  0607 1849  0522 1921  0453 1951  0455 2001  0519 1941  0550 1857  0620 1806  0655 1719  0730 1656
02  0750 1706  0734 1742  0657 1816  0606 1850  0520 1922  0453 1951  0455 2001  0520 1940  0551 1855  0622 1804  0656 1718  0731 1655
03  0750 1707  0733 1743  0656 1817  0604 1851  0519 1923  0453 1952  0456 2000  0521 1939  0552 1854  0623 1803  0657 1717  0732 1655'

#organizes each row into its relevant hash value

rawArr = table.split("\n")
#rawHash = Hash["row1" => [], "row2" => [], "row3" => []]

#declare hash variable
rawHash = Hash.new

#manually inject each row from table
rawHash["row1"] = rawArr[3].split(" ")
rawHash["row2"] = rawArr[4].split(" ")
rawHash["row3"] = rawArr[5].split(" ")

=begin
#CE working on this right now
#print out each table row from hash
rawHash.each do |row, arr|
  #puts "#{row}: #{arr}"
  if 
  
  end
end
=end

#declare hash variables
monthHash = Hash.new
monthHash["Jan."] = []
monthHash["Feb."] = []
monthHash["Mar."] = []

#manually inject each month from rawHash
#                            changing element
#                               ______
monthHash["Jan."].push (rawHash["row1"][1..2])
monthHash["Jan."].push (rawHash["row2"][1..2])
monthHash["Jan."].push (rawHash["row3"][1..2])

monthHash["Feb."].push (rawHash["row1"][3..4])
monthHash["Feb."].push (rawHash["row2"][3..4])
monthHash["Feb."].push (rawHash["row3"][3..4])

monthHash["Mar."].push (rawHash["row1"][5..6])
monthHash["Mar."].push (rawHash["row2"][5..6])
monthHash["Mar."].push (rawHash["row3"][5..6])

#puts(monthHash)


=begin
months = rawArr[0].split(" ")
#puts(months[0..-1])
#puts("\n")
#puts(rawArr[1])
#puts("\n")
row1 = rawArr[3].split(" ")
row2 = rawArr[4].split(" ")
row3 = rawArr[5].split(" ")

puts(row1[1..-1])
#puts(months[0] + " sunrise: " + row1[1] + ", sunset: " + row1[2])
#puts(months[1] + " sunrise: " + row1[3] + ", sunset: " + row1[4])
#puts(months[2] + " sunrise: " + row1[5] + ", sunset: " + row1[6])

#puts("\n")
#puts(rawArr[4])
#puts("\n")
#puts(rawArr[5])
=end
