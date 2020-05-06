require 'pry'
require 'nokogiri'
require 'open-uri'

class TravelGuide::Place

  attr_accessor  :name, :country, :best_time, :transport, :weather, :know_before, :language, :electric, :currency, :place_url
  FONT_STYLE = Artii::Base.new :font => 'slant'


  @@all = []
 

  def self.all
    @@all
  end

  def scrape_details
    html = open(self.place_url).read 
    doc = Nokogiri::HTML.parse(html)
    
      self.best_time = doc.css(".content-wrap > div:nth-child(2) > div > p").text.strip
      self.transport = doc.css(".content-wrap > div:nth-child(3) > div > p").text.strip
      self.weather = doc.css(".content-wrap > div:nth-child(4) > div > p").text.strip
      self.know_before = doc.css(".content-wrap > div:nth-child(5) > div > p").text.strip
      self.language = doc.css(".content-wrap > div:nth-child(6) > div > p").text.strip
      self.electric = doc.css(".content-wrap > div:nth-child(7) > div > p").text.strip
      self.currency = doc.css(".content-wrap > div:nth-child(8) > div > p").text.strip
      
      puts "#{FONT_STYLE.asciify(self.name)}\n #{FONT_STYLE.asciify(self.country)}".magenta
      puts
      puts "======================BEST TIME TO GO==============".blue
      puts "#{self.best_time}"
      puts
      puts "======================TRANSPORTATION===============".blue
      puts "#{self.transport}"
      puts
      puts "======================WEATHER======================".blue
      puts "#{self.weather}"
      puts
      puts "======================KNOW BEFORE VISITING========= ".blue
      puts "#{self.know_before}"
      puts
      puts "======================LANGUAGE=====================".blue
      puts "#{self.language}"
      puts
      puts "======================ELECTRIC=====================".blue
      puts "#{self.electric}"
      puts
      puts "======================CURRENCY=====================".blue
      puts "#{self.currency}"
      
  end

  def save
    @@all << self
  end 

  
end