require 'nokogiri'
require 'open-uri'

class Timetable < ActiveRecord::Base

  @first_station_not_available
  @last_station_not_available
  @stations_array = []
  @train_location_last

  def self.fetching_data(url)
    File.new('test_with_path.xml', 'w')
    data = Nokogiri::XML(open(url))
    File.open('test_with_path.xml', 'w') { |f| f.write data }
  end

  def self.opening_file
    @train_at_path_locations
    doc = Nokogiri::XML(File.open("test_with_path.xml"))
    @train_tables = doc.css("TrainTimeTable")

    puts @train_tables.count

    @train_tables.each do |i|

      @train_id = i.css('TrainIdent PathIdent')
      @train_locations = i.css('TrainAtPathLocation')

      if i.css('TrainPathNotAvailable')
        @first_station_not_available = i.css('FromLocationIdent LocationSubsidiaryCode')
        puts @train_location_last = i.css('ToLocationIdent LocationSubsidiaryCode').text
        break
      else
        puts 'IN'
        @train_location_first = i.css('TrainAtPathLocation LocationIdent LocationSubsidiaryCode').first

        puts @train_location_last = i.css('TrainAtPathLocation LocationIdent LocationSubsidiaryCode').last
      end
      # Timetable.create(
      #     train_id: @train_id,
      #     start_location:
      #
      # )

    end
    # this part is about to create more services once we get more information
    # @stations_array = @train_locations.map do |j|
    #   j.css('LocationIdent LocationSubsidiaryCode')
    # end

    #cleaning_timetable(@stations, @first_station_not_available.text, @last_station_not_available.text)

  end


  def self.cleaning_timetable(station_list, from, to)
      result = []
      result << to
      removing_items = true
      station_list.each do |station|
        result << station unless removing_items == true

        if station.text == from
          removing_items = true
        end
        if station.text == to
          removing_items = false
        end
      end

    puts result
  end

    #@final_stop =


    #puts 'RESULTS: '
    #puts @final_stop.map{ |i| i}
    #puts @final_stop


    #@train_at_path_locations = doc.css("TrainTimeTable TrainAtPathLocation").map {|node| node}
    #@train_path_not_available = doc.css('TrainTimeTable TrainPathNotAvailable').map { |node| node}
    #puts @train_at_path_locations.length


    #puts @train_path_not_available.count
    # @listing_th_times = @train_path_not_available.map{ |i| i.css('ToLocationIdent LocationSubsidiaryCode').text}
    # puts @listing_th_times

    #puts @train_at_path_locations[20]

    #puts 'Departure Time: '
    #puts @train_at_path_locations[20].css('DepartureTimeAtLocation').text

    #puts @train_at_path_locations.search('TrainPathNotAvailable').map{|i| i }


    # [100,200,300,400].inject(0) {|count, element| count+1}


end


