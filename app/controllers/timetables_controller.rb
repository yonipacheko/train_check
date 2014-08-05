class TimetablesController < ApplicationController
  def index
    #@timetables = Timetable.all
   # @results = Timetable.find_train_and_next_routes(params[:search_term])
    #@results = Timetable.find_train_and_next_routes(params[:search_term])



    if params[:search_term].blank?
      p 'it works'
      flash[:error] = "There's no any train with this number"
      @results = Timetable.search_by_number(params[:search_term])

    else
      @results = Timetable.search_by_number(params[:search_term])
    end

  end


  def search
  end
end
