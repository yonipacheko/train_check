class TrainSearch

    attr_reader :data

    def initialize
      @data = Timetable.all
    end

    def rows
      @rows ||= @data.map {|row| Row.new(row)}
    end
end