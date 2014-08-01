class TrainSearch

    attr_reader :data

    def initialize
      @data = Timetable.all
    end

    def rows
      @rows ||= @data.map {|row| Row.new(row)}
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
        @row[:name]
      end

      def start_location
        @row[:start_location]
      end

      def end_location
        @row[:end_location]
      end
    end
end
