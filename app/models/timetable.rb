require 'nokogiri'
require 'open-uri'

class Timetable < ActiveRecord::Base


  def self.search_by_number(number)

    where("train_id LIKE ?", "%#{number}%")

  end


  def self.find_train(train_number)
      where(train_id: train_number).first
  end


  def self.find_next_route(arrival_time, final_location)

    where("departure_time >= ? AND start_location == ?" , "#{arrival_time}", "#{final_location}" ).first
  end

  def self.find_train_and_next_routes(train_number)
    if find_train(train_number)
      train = find_train(train_number)
      routes = [train] #add the train as the first route
    end
    # we search first to see if we find a route
    # we reassign the train variable to the new train found
    #if(train = find_next_route(train.end_date, train.end_location))
    i = 0
    while i <= Timetable.all.count do
      if( train = find_next_route(routes[-1].arrival_time, routes[-1].final_location) )
        routes << train
      end
      i += 1
    end
    # at the end return the train and the routes
    return routes
  end


  #seed the DB from here

  def self.seeding_the_db
    @train_at_path_locations
    doc = Nokogiri::XML(File.open("fixed.xml"))
    @train_tables = doc.css("TrainTimeTable")


    @train_tables.each do |i|

      @train_id = i.css('TrainIdent PathIdent').text
      @train_locations = i.css('TrainAtPathLocation')
      @departure_time =   i.css('TrainAtPathLocation DepartureTimeAtLocation').first.text
      @first_train_location = i.css('TrainAtPathLocation LocationIdent LocationSubsidiaryCode').first.text


      if i.at_css('TrainPathNotAvailable')
        @end_location = i.css('ToLocationIdent LocationSubsidiaryCode').text
        @train_locations.each do |j|
          if j.at_css('LocationIdent LocationSubsidiaryCode').text == @end_location
            if j.at_css('DepartureTimeAtLocation')
              @arrival_time = j.css('DepartureTimeAtLocation').text
            else
              @arrival_time = j.css('ArrivalTimeAtLocation').text
            end
          end
        end
        @last_train_location  = @end_location
      else
        @end_location = i.css('TrainAtPathLocation LocationIdent LocationSubsidiaryCode').last.text
        @last_train_location = @end_location
        @arrival_time = i.css('TrainAtPathLocation ArrivalTimeAtLocation').last.text
      end

      Timetable.create(
          train_id: @train_id,
          start_location: @first_train_location,
          departure_time: @departure_time,
          final_location: @last_train_location,
          arrival_time: @arrival_time
      )
    end
  end


end


