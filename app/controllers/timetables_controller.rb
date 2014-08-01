class TimetablesController < ApplicationController
  def index
    @timetables = Timetable.all
    train = TrainSearch.new
    @results = train.find_train_and_next_routes(params[:search_term])
  end


  def search
    #@results = Timetable.search_by_number(params[:search_term])
  end
end
