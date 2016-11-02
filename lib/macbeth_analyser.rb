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
			@speakers[split_string[1]] = @speakers[split_string[1]].nil? ? 0 : @speakers[split_string[1]] + split_string.length - 2
		end

		@xml.xpath("//SPEAKER").each do |node|
			@speakers[node.content] = @speakers[node.content].nil? ? 0 : @speakers[node.content] + 1
		end


	end

	def print_line
		@speakers.each do |key, value|
			puts "#{value} #{key}"
		end
	end

	def source_location
		SOURCE_LOCATION
	end
end

mac = MacbethAnalyser.new
mac.xml_parse
mac.print_line