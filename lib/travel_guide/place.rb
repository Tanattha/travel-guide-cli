class TravelGuide::Place

  attr_accessor  :name, :country, :best_time, :transport, :weather, :know_before, :language, :electric, :currency, :place_url
  FONT_STYLE = Artii::Base.new :font => 'slant'

  @@all = []
 
  def self.all
    @@all
  end

  def self.sorted_name
    @@sorted_name
  end

  def save
    @@all << self
  end 

  def self.show_main_list
    table = Terminal::Table.new :headings => ['Number', 'Name','Country'], :style => {:width => 100} do |t|
      TravelGuide::Place.all.each_with_index do |place, i|
      t << ["#{i+1}","#{place.name}","#{place.country}"]
      t << :separator
      end
      puts t
    end
  end

  def self.sort_by_place_name
    table = Terminal::Table.new :headings => ['Number', 'Name','Country'], :style => {:width => 100} do |t|
      @@sorted_name = TravelGuide::Place.all.sort {|a,b| a.name <=> b.name} 
      @@sorted_name.each_with_index do |sorted , i|
        t << ["#{i+1}", "#{sorted.name}", "#{sorted.country}"]
        t << :separator
      end
      puts t
    end
  end

  def self.sort_by_country_name
    table = Terminal::Table.new :headings => ['Number', 'Name','Country'], :style => {:width => 100} do |t|
      @@sorted_name = TravelGuide::Place.all.sort {|a,b| a.country <=> b.country} 
      @@sorted_name.each_with_index do |sorted , i|
      t << ["#{i+1}", "#{sorted.name}", "#{sorted.country}"]
      t << :separator
      end
      puts t
    end
  end

end