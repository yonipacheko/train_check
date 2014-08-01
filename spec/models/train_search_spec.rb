require 'rails_helper'
describe TrainSearch do

  let (:checker) {TrainSearch.new}

  it ':rows has 46 items' do
    expect(checker.data).to eq(46)

  end

end