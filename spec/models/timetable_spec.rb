require 'rails_helper'
describe Timetable do

  it 'should find the train row by the train number requested' do

    t1 = Timetable.create(train_id: '2345')
    t2 = Timetable.create(train_id: '2323')

    expect(Timetable.find_train('2345')).to eq(t1)
  end

  describe 'find next route' do


    it 'find the next route for the train' do

      t1 = Timetable.create( train_id: '01251', departure_time: '2014-04-24 22:03:00', start_location: 'A', arrival_time: '2014-04-24 22:10:00', final_location: 'BC' )
      t2 = Timetable.create( train_id: '05012', departure_time: '2014-04-24 22:20:00', start_location: 'RI', arrival_time: '2014-04-24 23:10:00', final_location: 'XX' )
      t3 = Timetable.create( train_id: '04545', departure_time: '2014-04-24 22:15:00', start_location: 'BC', arrival_time: '2014-04-24 22:20:00', final_location: 'RI' )
      t4 = Timetable.create( train_id: '03232', departure_time: '2014-04-24 17:10:00', start_location: 'X', arrival_time: '2014-04-24 20:10:00', final_location: 'B' )

       expect(Timetable.find_next_route(t1.arrival_time, t1.final_location)).to eq(t3)
    end
  end
  describe 'find train and its next routes' do


    it 'last step' do

      t1 = Timetable.create( train_id: '01251', departure_time: '2014-04-24 22:03:00', start_location: 'A', arrival_time: '2014-04-24 22:10:00', final_location: 'BC' )
      t2 = Timetable.create( train_id: '05012', departure_time: '2014-04-24 22:20:00', start_location: 'RI', arrival_time: '2014-04-24 23:10:00', final_location: 'XX' )
      t3 = Timetable.create( train_id: '04545', departure_time: '2014-04-24 22:15:00', start_location: 'BC', arrival_time: '2014-04-24 22:20:00', final_location: 'RI' )
      t4 = Timetable.create( train_id: '03232', departure_time: '2014-04-24 17:10:00', start_location: 'X', arrival_time: '2014-04-24 20:10:00', final_location: 'B' )

      expect(Timetable.find_train_and_next_routes(t1.train_id)).to match_array([t1,t3, t2 ])
    end
  end

end




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

# it ':rows has 2 items' do
#
#   t1 = Timetable.create(train_id: '2345')
#   t2 = Timetable.create(train_id: '2323')
#
#   expect(user.rows.count).to eq(2)
# end
