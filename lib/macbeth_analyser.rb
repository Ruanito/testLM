require 'open-uri'

class MacbethAnalyser
	SOURCE_LOCATION = "http://www.ibiblio.org/xml/examples/shakespeare/macbeth.xml"

	def initialize
		@source = File.read(open(SOURCE_LOCATION))
	end

	def source_location
		SOURCE_LOCATION
	end
end