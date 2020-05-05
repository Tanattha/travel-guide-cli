class TravelGuide::CLI 

  def call
       TravelGuide::Scraper.new.scrape_places
       puts "Welcome! Where would you like to check out?"
        list_places
        goodbye
        show_place(input)
  end

  def list_places
      
      puts "Please Select Options: 1:Show List  2:Sort  3.Exit"
      input = gets.strip

    if input == "1"
      show_list
    elsif input == "2"
      sort_list
    elsif input == "3"
      goodbye
    else
      "Sorry, I don't understand."
      list_places
    end 
  end

  def sort_list
    puts "Please Select Options:"
    puts "Sort by : 1.Place name(A-Z) 2.Country name(A-Z)"
    input = gets.strip
    
      if input == "1"
        sort_by_place_name
      elsif input == "2"
        sort_by_country
      else
        error
      end
  end

  def sort_by_place_name
    sorted_name = TravelGuide::Place.all.sort {|a,b| a.name <=> b.name} 
    sorted_name.each_with_index do |sorted , i|
      puts "#{i+1}. #{sorted.name} - #{sorted.country}"
    end
  end
  
  def show_list
      TravelGuide::Place.all.each_with_index do |place, i|
        #binding.pry
        puts "#{i+1}. #{place.name} - #{place.country}"
      end
    puts
    menu
  end
  
  def menu 
    input = nil 
  
    while input != "exit"
      puts "Type the number of a place you want to check out or type q for Exit:"
      puts

      input = gets.strip
      
      if input_valid?(input)
        input.to_i <= TravelGuide::Place.all.size
        place = TravelGuide::Place.all[input.to_i-1]
        puts place.scrape_details
        puts
        puts "Type m: Back to the Main Menu or type q: Exit"
        input = gets.strip
          if input == "m" || input == "M"
            list_places
          elsif input == "q" || input == "Q"
            goodbye 
          else
            error
            show_list
          end
        
      elsif input == "q" || input == "Q"
        goodbye 
      else
        error
        show_list
      end
    end
  end


  def input_valid?(input)
    if input.to_i >= TravelGuide::Place.all.size || input.to_i <= 0
      false
    else
      true
    end
  end

  def error
    puts "Sorry, I don't understand. Please type again."
  end

  def goodbye
    puts "See you next time!"
    exit
  end 

end


    