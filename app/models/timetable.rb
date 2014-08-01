require 'nokogiri'
require 'open-uri'

class Timetable < ActiveRecord::Base


  def self.search_by_number(number)

    where("train_id LIKE ?", "%#{number}%")

  end





end


