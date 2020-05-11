
require 'open-uri'
require 'nokogiri'
require 'pry'


class TravelGuide::Scraper 
  FONT_STYLE = Artii::Base.new :font => 'slant'

  def scrape_places
    
    base_url = "https://www.travelandleisure.com/travel-guide"
    html = open(base_url).read 
    page = Nokogiri::HTML.parse(html)
    page.css(".content-wrap > ul > li").each do |list_place|
    place = TravelGuide::Place.new 
     
      name = list_place.css("div > a > div > span.grid__item__title").text
      place.name = name 

      country = list_place.css("div > a > div > span.grid__item__cat").text
      place.country = country 

      if name != "" && name != " " && name != nil
        place_url = list_place.css("div > a").attribute("href").value
        place.place_url = place_url 
        place.save
      end
    end
  end

  def self.scrape_details(place)
    html = open(place.place_url).read 
    doc = Nokogiri::HTML.parse(html)
    
      place.best_time = doc.css(".content-wrap > div:nth-child(2) > div > p").text.strip
      place.transport = doc.css(".content-wrap > div:nth-child(3) > div > p").text.strip
      place.weather = doc.css(".content-wrap > div:nth-child(4) > div > p").text.strip
      place.know_before = doc.css(".content-wrap > div:nth-child(5) > div > p").text.strip
      place.language = doc.css(".content-wrap > div:nth-child(6) > div > p").text.strip
      place.electric = doc.css(".content-wrap > div:nth-child(7) > div > p").text.strip
      place.currency = doc.css(".content-wrap > div:nth-child(8) > div > p").text.strip
      
      puts "#{FONT_STYLE.asciify(place.name)}\n #{FONT_STYLE.asciify(place.country)}".magenta
      puts
      puts "======================BEST TIME TO GO==============".blue
      puts "#{place.best_time}"
      puts
      puts "======================TRANSPORTATION===============".blue
      puts "#{place.transport}"
      puts
      puts "======================WEATHER======================".blue
      puts "#{place.weather}"
      puts
      puts "======================KNOW BEFORE VISITING========= ".blue
      puts "#{place.know_before}"
      puts
      puts "======================LANGUAGE=====================".blue
      puts "#{place.language}"
      puts
      puts "======================ELECTRIC=====================".blue
      puts "#{place.electric}"
      puts
      puts "======================CURRENCY=====================".blue
      puts "#{place.currency}"
  end

end
  