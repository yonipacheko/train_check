class VideoSearch

    attr_accessor :data

    def initialize

      @data = Timetable.all
      #require 'pry'; binding.pry
    end

    def rows
      @rows ||= @data.map {|row| Row.new(row)}
    end

    def find_video(train_number)
      rows.find { |row| row.name == train_number }
    end



    # Do this because we need to parse the date into a time to sort
    class Row
      def initialize(row)
        @row = row
      end

      def start_date
        DateTime.parse(@row[:start_date])
      end

      def end_date
        DateTime.parse(@row[:end_date])
      end

      def name
        @row[:train_id]
      end

      def start_location
        @row[:start_location]
      end

      def end_location
        @row[:end_location]
      end
    end
end
