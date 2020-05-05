
require 'open-uri'
require 'nokogiri'
require 'pry'


class TravelGuide::Scraper 

  def initialize(name=nil,country=nil,place_url=nil,best_time=nil,transport=nil,weather=nil,know_before=nil,language=nil,electric=nil,currency=nil)

    @name = name 
    @country = country
    @place_url = place_url
    @best_time = best_time
    @transport = transport
    @weather = weather
    @know_before = know_before
    @language = language
    @electric = electric
    @currency = currency
    
  end

  def scrape_places
    
    base_url = "https://www.travelandleisure.com/travel-guide"
   
    html = open(base_url).read 
    page = Nokogiri::HTML.parse(html)
    
    page.css(".content-wrap > ul > li").each do |list_place|
      place = TravelGuide::Place.new 
     
      name = list_place.css("div > a > div > span.grid__item__title").text.gsub(/\s+/, "")
      place.name = name 

      country = list_place.css("div > a > div > span.grid__item__cat").text.gsub(/\s+/, "")
      place.country = country 

      if name != "" && name != " " && name != nil
        place_url = list_place.css("div > a").attribute("href").value
        place.place_url = place_url 
        place.save
      end
    end
  end
  
end
  