require 'rails_helper'

# We will test the parsing here
# test each step as you make progress
describe TrainTableParser do

  let(:xml) { File.open("#{Rails.root}/spec/support/test_with_path.xml").read }
  let(:parser) { TrainTableParser.new(xml) }

  it "is able to open the xml" do
    expect(xml).not_to be_blank
  end

  it "is able to instantiate the train parser class" do
    expect(parser.class).to eq(TrainTableParser)
  end

  it "is able to parse the train tables out of the xml" do
    expect(parser.train_tables.length).to eq(2)
  end

  it "is able to get the train id from each train table" do
    expect(parser.train_tables.map {|train_table| train_table.train_id}).to eq(["041907", "041902"])
  end

  it "is able to get the train location from each train table" do
    expect(parser.train_tables.map {|train_table| train_table.train_location}).to eq([1,2])
  end
end

