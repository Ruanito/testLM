require 'nokogiri'

class MacbethAnalyser

	XML_SOURCE = 'http://www.ibiblio.org/xml/examples/shakespeare/macbeth.xml'

	def initialize
		file = File.read(open(XML_SOURCE))
	end

end