require_relative '../lib/dependecy_parser'

RSpec.describe DependencyParser do
  let(:input) { "rails activerecord mysql socket activerecord mysql rails activesupport activerecord yaml" }
  let(:parser) { DependencyParser.new(input) }

  describe "#to_string" do
    let(:result) { parser.to_string }

    it "returns a string" do
      expect(result).to be_a(String)
    end

    it "ignores duplicates" do
      expect(result.scan(/mysql/).count).to eq(1)
    end

    it "orders dependencies" do
      dep_sample = result.scan(/activerecord rails/).first
      expect(dep_sample).to eq("activerecord rails")
    end
  end

end
