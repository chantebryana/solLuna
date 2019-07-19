a = ["10","","","","20","30","","40","",""]
b = []

#CE try this: https://stackoverflow.com/questions/18924068/how-do-i-iterate-through-a-file-in-ruby-while-using-peek-and-not-lose-half-of
a.each_cons(2) do |x|
	if x == ["", ""]
		b.push(0)
	else
		b.push(1)
	end
end

print b

#I could track which index and use that to manually navigate through actual array.push??