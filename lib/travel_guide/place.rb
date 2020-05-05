require 'pry'
require 'nokogiri'
require 'open-uri'

class TravelGuide::Place

  attr_accessor  :name, :country, :best_time, :transport, :weather, :know_before, :language, :electric, :currency, :place_url

  @@all = []
 

  def self.all
    @@all
  end

  def scrape_details
    html = open(self.place_url).read 
    doc = Nokogiri::HTML.parse(html)
    
      self.best_time = doc.css(".content-wrap > div:nth-child(2) > div > p").text.gsub(/\s+/, "")
      self.transport = doc.css(".content-wrap > div:nth-child(3) > div > p").text.gsub(/\s+/, "")
      self.weather = doc.css(".content-wrap > div:nth-child(4) > div > p").text. gsub(/\s+/, "")
      self.know_before = doc.css(".content-wrap > div:nth-child(5) > div > p").text.gsub(/\s+/, "")
      self.language = doc.css(".content-wrap > div:nth-child(6) > div > p").text.gsub(/\s+/, "")
      self.electric = doc.css(".content-wrap > div:nth-child(7) > div > p").text.gsub(/\s+/, "")
      self.currency = doc.css(".content-wrap > div:nth-child(8) > div > p").text.gsub(/\s+/, "")
      
      puts
      puts "#{self.name} - #{self.country}"
      puts
      puts "=======Best Time To Go========"
      puts "#{self.best_time}"
      puts
      puts "=======Trabsportation========="
      puts "#{self.transport}"
      puts
      puts "============Weather==========="
      puts "#{self.weather}"
      puts
      puts "======Know Before You Go======"
      puts "#{self.know_before}"
      puts
      puts "===========Language==========="
      puts "#{self.language}"
      puts
      puts "===========Electric==========="
      puts "#{self.electric}"
      puts
      puts "===========Currency==========="
      puts "#{self.currency}"
      
  end

  def sort_by_country
   puts self.all.sort_by { |a,b| a.country <=> b.country}
  end

  def save
    @@all << self
  end 

  
end