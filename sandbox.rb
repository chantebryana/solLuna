a = ["10","","","","20","30","","40","",""]

#CE try this: https://stackoverflow.com/questions/18924068/how-do-i-iterate-through-a-file-in-ruby-while-using-peek-and-not-lose-half-of
a.each_with_index do |x, i|
	if i == ""
		puts x 
	end
end