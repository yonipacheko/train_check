require 'rails_helper'
describe VideoSearch do

  let! (:user) {VideoSearch.new}

  # What am I doing actually here?
  # I thought that I was doing almost the same thing like the
  # bellow?? :()

  # it ':rows has 46 items' do
  #   checker = TrainSearch.new
  #   checker.data = Timetable.create(train_id: '2345')
  #   checker.data = Timetable.create(train_id: '2323')
  #
  #   expect(checker.data.count).to eq(2)
  #
  # end

  it ':rows has 2 items' do

    t1 = Timetable.create(train_id: '2345')
    t2 = Timetable.create(train_id: '2323')

    expect(user.rows.count).to eq(2)
  end

  it 'find the right video' do

    t1 = Timetable.create(train_id: '2345')
    t2 = Timetable.create(train_id: '2323')

    expect(user.find_video('2345')).to eq([t1])
  end

end