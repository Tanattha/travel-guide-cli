class TravelGuide::CLI 
  
  @@sorted_name = []
 
  def self.all
    @@sorted_name
  end

  def call
    TravelGuide::Scraper.new.scrape_places
    puts "#{File.open("pics/welcome.txt").read}\n".red.center(100, ' ')
    puts "======================TRAVEL GUIDE=====================".center(100, ' ').blue
    puts
    puts "Welcome To Travel Guide! Where would you like to go?\n".center(100, ' ').yellow
      main_menu
      goodbye
      options_menu 
  end

  def main_menu
    puts "=======================================================".center(100, ' ').blue
    puts "Please Select Options: 1:Show List  2:Sort  Type q:Exit".center(100, ' ')
    puts "=======================================================".center(100, ' ').blue
    input = gets.strip

    if input == "1"
      puts
      show_list
    elsif input == "2"
      sort_list
    elsif input == "q" || input == "Q"
      goodbye
    else
      error
    end 
  end

  def show_list
    puts
    puts "======================MAIN LIST(A-Z)=====================".center(100, ' ').blue
    puts
    puts TravelGuide::Place.show_main_list

    input = nil
    puts
    puts "Type the number of a place you would like to go, Type s: Back to the Sort Menu, Type q: Exit".center(100, ' ').yellow
      input = gets.strip
      if input == "s" || input == "S"
        sort_list
      elsif input == "q" || input == "Q"
        goodbye
      elsif
        if input_valid?(input)
          place = TravelGuide::Place.all[input.to_i-1]
          puts TravelGuide::Scraper.scrape_details(place)
          puts
        end
      end
    options_menu
  end

  def options_menu
    puts "Type m: Back to the Main Menu, Type s: Back to the Sort Menu Type q: Exit".center(100, ' ').yellow
    input = gets.strip
      if input == "m" || input == "M"
        main_menu
      elsif input == "s" || input == "S"
        sort_list
      elsif input == "q" || input == "Q"
        goodbye 
      else
        error
      end
  end

  def sort_list
    puts "=======================================================".center(100, ' ').blue
    puts "Please Select Options:".center(100, ' ')
    puts "Sort by : 1.Place name(A-Z) 2.Country name(A-Z)".center(100, ' ')
    puts "=======================================================".center(100, ' ').blue
    input = gets.strip
    
      if input == "1"
        menu_sort_by_place_name
      elsif input == "2"
        menu_sort_by_country_name
      else
        error
      end
  end

  def menu_sort_by_place_name
    puts "======================SORT BY PLACE NAME=====================".center(100, ' ').blue
    puts TravelGuide::Place.sort_by_place_name

    input = nil
    puts "Type the number of a place you would like to go, Type s: Back to the Sort Menu, Type q: Exit".center(100, ' ').yellow
    input = gets.strip
      if input == "s" || input == "S"
        sort_list
      elsif input == "q" || input == "Q"
        goodbye
      elsif
        if input_valid?(input)
          place = TravelGuide::Place.sorted_name[input.to_i-1]
          puts TravelGuide::Scraper.scrape_details(place)
        end
      end
    options_menu
  end

  def menu_sort_by_country_name
    puts "======================SORT BY COUNTRY NAME=====================".center(100, ' ').blue
    puts TravelGuide::Place.sort_by_country_name

    input = nil
    puts
    puts "Type the number of a place you would like to go, Type s: Back to the Sort Menu, Type q: Exit".center(100, ' ').yellow
    input = gets.strip
      if input == "s" || input == "S"
        sort_list
      elsif input == "q" || input == "Q"
        goodbye
      elsif
        if input_valid?(input)
          place = TravelGuide::Place.sorted_name[input.to_i-1]
          puts TravelGuide::Scraper.scrape_details(place)
        end
      end
    options_menu
  end

  def input_valid?(input)
    if input.to_i >= TravelGuide::Place.all.size || input.to_i <= 0
      false
    else
      true
    end
  end

  def error
    puts
    puts "Sorry, I don't understand.".center(100, ' ').yellow
    main_menu
  end

  def goodbye
    puts "See you next time!".center(100, ' ').yellow
    sleep 1
    system("clear")
    exit
  end 

end


    