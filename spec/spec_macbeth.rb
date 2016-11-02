require 'macbeth_analyser'

RSpec.describe MacbethAnalyser, "Read File" do

	context "Source" do
		it "Source location" do
			macbeth = MacbethAnalyser.new('macbeth.xml')
			expect(macbeth.source_location).to eq 'http://www.ibiblio.org/xml/examples/shakespeare/macbeth.xml'
		end
	end

	context "Speakers" do
		it "Hash new" do
			macbeth = MacbethAnalyser.new('macbeth.xml')
			expect(macbeth.speakers).to eq Hash.new
		end

		it "Hash DUNCAN nil" do
			macbeth = MacbethAnalyser.new('macbeth.xml')
			expect(macbeth.speakers['DUNCAN']).to eq nil
		end

		it "Hash DUNCAN count" do
			macbeth = MacbethAnalyser.new('macbeth.xml')
			macbeth.xml_parse
			expect(macbeth.speakers['DUNCAN']).to exist
		end
	end
end