require 'macbeth_analyser'

RSpec.describe MacbethAnalyser, "Read File" do

	context "empty" do
		it "Source location" do
			macbeth = MacbethAnalyser.new
			expect(macbeth.source_location).to eq 'http://www.ibiblio.org/xml/examples/shakespeare/macbeth.xml'
		end
	end
end