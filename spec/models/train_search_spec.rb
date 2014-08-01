require 'rails_helper'
describe TrainSearch do

  let! (:checker) {TrainSearch.new}


  it ':rows has 46 items' do
    checker.data = Timetable.all
    expect(checker.data.count).to eq(46)

  end

end