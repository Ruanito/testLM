require 'open-uri'
require 'nokogiri'

class MacbethAnalyser
	SOURCE_LOCATION = "http://www.ibiblio.org/xml/examples/shakespeare/macbeth.xml"

	def initialize
		@xml = Nokogiri::XML(open(SOURCE_LOCATION)) do |config|
		  config.strict.nonet
		end

		@speakers = Hash.new
	end

	def xml_parse
		@xml.xpath("//SPEECH").each do |node|
			split_string = node.content.split("\n")
			@speakers[split_string[1]] = @speakers[split_string[1]].nil? ? split_string.length - 2 : @speakers[split_string[1]] + split_string.length - 2
			node.content.lines.each do |line|
			end
		end
	end

	def print_line
		@speakers.each do |key, value|
			if key != "ALL"
				puts "#{value} #{key}"
			end
		end
	end

	def speakers
		@speakers
	end

	def source_location
		SOURCE_LOCATION
	end
end

mac = MacbethAnalyser.new
mac.xml_parse
mac.print_line