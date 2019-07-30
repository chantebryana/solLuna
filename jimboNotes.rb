#Lumping w/ Jimbo: next steps
require "./sun_moon_importer"

dataSet = SunMoonImporter.import("./datafile.txt")

months.each do |currentMonth|
	currentMonth.days.each do |currentDay|
		puts dataSet.riseTime(currentMonth, currentDay)
	end
end

module ModName
	def self.mod_method()
	end
end

class ClassName
	def self.mod_methods()
	end
	
	def inst_method()
	end
end