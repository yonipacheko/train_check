class TimetablesController < ApplicationController
  def index
    if (params[:search_term]).blank?
      flash[:error] = "the search field can't be empty"
      render 'index'
    else
      @results = Timetable.find_train_and_next_routes(params[:search_term])
    end
    #require 'pry'; binding.pry
  end

  def search
    render 'index'
  end
end
