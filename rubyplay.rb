=begin
table = 'Jan.       Feb.       Mar.       Apr.       May        June       July       Aug.       Sept.      Oct.       Nov.       Dec. 
Day Rise  Set  Rise  Set  Rise  Set  Rise  Set  Rise  Set  Rise  Set  Rise  Set  Rise  Set  Rise  Set  Rise  Set  Rise  Set  Rise  Set
    h m  h m   h m  h m   h m  h m   h m  h m   h m  h m   h m  h m   h m  h m   h m  h m   h m  h m   h m  h m   h m  h m   h m  h m
01  0750 1706  0735 1740  0659 1815  0607 1849  0522 1921  0453 1951  0455 2001  0519 1941  0550 1857  0620 1806  0655 1719  0730 1656
02  0750 1706  0734 1742  0657 1816  0606 1850  0520 1922  0453 1951  0455 2001  0520 1940  0551 1855  0622 1804  0656 1718  0731 1655
03  0750 1707  0733 1743  0656 1817  0604 1851  0519 1923  0453 1952  0456 2000  0521 1939  0552 1854  0623 1803  0657 1717  0732 1655'
=end

table = 
'       Jan.       Feb.       Mar.       Apr.       May        June       July       Aug.       Sept.      Oct.       Nov.       Dec.  
Day Rise  Set  Rise  Set  Rise  Set  Rise  Set  Rise  Set  Rise  Set  Rise  Set  Rise  Set  Rise  Set  Rise  Set  Rise  Set  Rise  Set
     h m  h m   h m  h m   h m  h m   h m  h m   h m  h m   h m  h m   h m  h m   h m  h m   h m  h m   h m  h m   h m  h m   h m  h m
01  0750 1706  0735 1740  0659 1815  0607 1849  0522 1921  0453 1951  0455 2001  0519 1941  0550 1857  0620 1806  0655 1719  0730 1656
02  0750 1706  0734 1742  0657 1816  0606 1850  0520 1922  0453 1951  0455 2001  0520 1940  0551 1855  0622 1804  0656 1718  0731 1655
03  0750 1707  0733 1743  0656 1817  0604 1851  0519 1923  0453 1952  0456 2000  0521 1939  0552 1854  0623 1803  0657 1717  0732 1655
04  0750 1708  0732 1744  0654 1818  0603 1852  0518 1924  0452 1953  0456 2000  0522 1937  0553 1852  0624 1801  0659 1716  0733 1655
05  0750 1709  0731 1745  0652 1819  0601 1853  0517 1925  0452 1953  0457 2000  0523 1936  0554 1850  0625 1759  0700 1715  0734 1655
06  0750 1710  0730 1747  0651 1820  0559 1854  0515 1926  0452 1954  0458 2000  0524 1935  0555 1849  0626 1758  0701 1714  0735 1655
07  0750 1711  0729 1748  0649 1821  0558 1855  0514 1927  0451 1955  0458 1959  0525 1934  0556 1847  0627 1756  0702 1713  0736 1655
08  0750 1712  0728 1749  0648 1823  0556 1856  0513 1928  0451 1955  0459 1959  0526 1933  0557 1845  0628 1755  0703 1711  0737 1655
09  0749 1713  0727 1750  0646 1824  0554 1858  0512 1929  0451 1956  0459 1959  0527 1931  0558 1844  0629 1753  0705 1710  0738 1655
10  0749 1714  0725 1752  0644 1825  0553 1859  0511 1931  0451 1956  0500 1958  0528 1930  0559 1842  0630 1751  0706 1709  0739 1655
11  0749 1715  0724 1753  0643 1826  0551 1900  0510 1932  0451 1957  0501 1958  0529 1929  0600 1840  0631 1750  0707 1708  0739 1655
12  0749 1716  0723 1754  0641 1827  0550 1901  0509 1933  0451 1957  0502 1957  0530 1927  0601 1839  0632 1748  0708 1707  0740 1655
13  0748 1717  0722 1755  0639 1828  0548 1902  0508 1934  0450 1958  0502 1957  0531 1926  0602 1837  0633 1747  0709 1707  0741 1655
14  0748 1718  0720 1757  0638 1829  0546 1903  0507 1935  0450 1958  0503 1956  0532 1925  0603 1835  0634 1745  0711 1706  0742 1655
15  0747 1720  0719 1758  0636 1830  0545 1904  0506 1936  0450 1959  0504 1956  0533 1923  0604 1833  0635 1743  0712 1705  0742 1656
16  0747 1721  0718 1759  0634 1832  0543 1905  0505 1937  0450 1959  0505 1955  0534 1922  0605 1832  0637 1742  0713 1704  0743 1656
17  0747 1722  0716 1800  0633 1833  0542 1906  0504 1938  0451 1959  0506 1954  0535 1920  0606 1830  0638 1740  0714 1703  0744 1656
18  0746 1723  0715 1801  0631 1834  0540 1907  0503 1938  0451 2000  0506 1954  0536 1919  0607 1828  0639 1739  0715 1702  0744 1657
19  0745 1724  0713 1803  0629 1835  0539 1908  0502 1939  0451 2000  0507 1953  0537 1917  0608 1827  0640 1737  0717 1702  0745 1657
20  0745 1725  0712 1804  0628 1836  0537 1909  0501 1940  0451 2000  0508 1952  0538 1916  0609 1825  0641 1736  0718 1701  0746 1657
21  0744 1727  0711 1805  0626 1837  0536 1910  0500 1941  0451 2000  0509 1951  0539 1914  0610 1823  0642 1734  0719 1700  0746 1658
22  0744 1728  0709 1806  0624 1838  0534 1911  0500 1942  0451 2001  0510 1951  0540 1913  0611 1821  0643 1733  0720 1700  0747 1658
23  0743 1729  0708 1808  0623 1839  0533 1913  0459 1943  0452 2001  0511 1950  0541 1911  0612 1820  0645 1731  0721 1659  0747 1659
24  0742 1730  0706 1809  0621 1840  0531 1914  0458 1944  0452 2001  0512 1949  0542 1910  0613 1818  0646 1730  0722 1659  0748 1700
25  0741 1732  0705 1810  0619 1841  0530 1915  0457 1945  0452 2001  0512 1948  0543 1908  0614 1816  0647 1729  0723 1658  0748 1700
26  0741 1733  0703 1811  0618 1842  0529 1916  0457 1946  0453 2001  0513 1947  0544 1907  0615 1815  0648 1727  0725 1658  0748 1701
27  0740 1734  0702 1812  0616 1844  0527 1917  0456 1947  0453 2001  0514 1946  0545 1905  0616 1813  0649 1726  0726 1657  0749 1701
28  0739 1735  0700 1813  0614 1845  0526 1918  0456 1947  0453 2001  0515 1945  0546 1903  0617 1811  0650 1725  0727 1657  0749 1702
29  0738 1737             0613 1846  0524 1919  0455 1948  0454 2001  0516 1944  0547 1902  0618 1809  0652 1723  0728 1656  0749 1703
30  0737 1738             0611 1847  0523 1920  0454 1949  0454 2001  0517 1943  0548 1900  0619 1808  0653 1722  0729 1656  0749 1704
31  0736 1739             0609 1848             0454 1950             0518 1942  0549 1859             0654 1721             0750 1704'

#organizes each row into its relevant hash value
rawArr = table.split("\n")

#declare hash variable
rawHash = Hash.new

#playing with .split(/ /)
#CE this looks like the workings of a solution!
e = []
(rawArr[33].split(/    /)).each do |x|
	if x == ""
		e.push("0")
	else
		x.split(" ").each do |y|
			e.push(y)
		end
	end
end
puts"output: "
print e
puts("\n\n")

=begin
#automatically inject each key from table
(1..31).each {|x| rawHash["row"+x.to_s] = rawArr[x+2].split(" ")}


#grab months from rawArr
months = rawArr[0].split(" ")

#declare hash variable
monthHash = Hash.new

#automatically populate monthHash keys with month names from table
months.each {|x| monthHash[x] = []}

#create an array with each month listed twice: this will help for the rawHash loop further down (provide two month indices to match up with two time values)
monthDoubleIndex = []
months.each do |x|
	monthDoubleIndex.push(x)
	monthDoubleIndex.push(x)
end

#CE working on this right now
#fully-automated loop that injects each month's data from rawHash
#still need to account for special logic required for rawHash rows 29, 30, 31
rawHash.each do |key, value|
	value[1..-1].each_with_index do |v, i|
		monthHash[(monthDoubleIndex[i])].push(v)
	end
end

#display monthHash to console
monthHash.each do |key, value|
  puts "#{key} #{value}"
  puts "\n"
end
=end