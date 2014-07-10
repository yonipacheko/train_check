# TrainTableParser will parse an xml stream
# and pick out train timetables
class TrainTableParser

  # initialize with a stream of xml containing the train timetables
  def initialize(xml)
    @xml = xml
  end

  def doc
    @doc ||= Nokogiri::XML(@xml)
  end

  def train_tables
    @train_tables ||= doc.css("TrainTimeTable").map {|train_time_table_xml| TrainTable.new(train_time_table_xml)}
  end


  class TrainTable
    def initialize(xml)
      @xml = xml
    end

    def train_id
      @xml.css('TrainIdent PathIdent').text
    end

    def train_location
      @xml.css('TrainIndent TrainAtPathLocation').text
    end
  end


end
