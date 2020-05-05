class TravelGuide::CLI 

  def call
       TravelGuide::Scraper.new.scrape_places
       
       puts "#{File.open("pics/welcome.txt").read}\n".red.center(100, ' ')
       puts "======================TRAVEL GUIDE=====================".center(100, ' ').blue
       puts
       puts "Welcome To Travel Guide! Where would you like to go?\n".center(100, ' ')
       

        list_places
        goodbye
        show_place(input)
  end

  def list_places
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
      "Sorry, I don't understand.".center(100, ' ')
      list_places
    end 
  end

  def sort_list
    puts "=======================================================".center(100, ' ').blue
    puts "Please Select Options:".center(100, ' ')
    puts "Sort by : 1.Place name(A-Z) 2.Country name(A-Z)".center(100, ' ')
    puts "=======================================================".center(100, ' ').blue
    input = gets.strip
    
      if input == "1"
        sort_by_place_name
      elsif input == "2"
        sort_by_country_name
      else
        error
      end
  end

  def sort_by_place_name
    puts "======================SORT BY PLACE NAME=====================".center(100, ' ').blue
    puts
    sorted_name = TravelGuide::Place.all.sort {|a,b| a.name <=> b.name} 
    sorted_name.each_with_index do |sorted , i|
      puts "#{i+1}. #{sorted.name} - #{sorted.country}".center(100, ' ')
      puts
    end
    menu
  end

  def sort_by_country_name
    puts "======================SORT BY COUNTRY NAME=====================".center(100, ' ').blue
    puts
    sorted_name = TravelGuide::Place.all.sort {|a,b| a.country <=> b.country} 
    sorted_name.each_with_index do |sorted , i|
      puts "#{i+1}. #{sorted.name} - #{sorted.country}".center(100, ' ')
      puts
    end
    menu
  end
  
  def show_list
    puts "========================MAIN LIST=======================".center(100, ' ').blue
    sorted_name = TravelGuide::Place.all.sort {|a,b| a.country <=> b.country} 
      TravelGuide::Place.all.each_with_index do |place, i|
        puts
        puts "#{i+1}. #{place.name} - #{place.country}".center(100, ' ')
        puts
      end
    puts
    menu
  end
  
  def menu 
    input = nil 
  
    while input != "exit"
      puts
      puts "Type the number of a place you want to check out, Type s: Back to the Sort Menu, Type q: Exit".center(100, ' ').yellow
      puts

      input = gets.strip
      
      if input_valid?(input)
        input.to_i <= TravelGuide::Place.all.size
        place = TravelGuide::Place.all[input.to_i-1]
        puts place.scrape_details
        puts
        puts "Type m: Back to the Main Menu, Type q: Exit".center(100, ' ').yellow
        input = gets.strip
          if input == "m" || input == "M"
            list_places
          elsif input == "s" || input == "S"
            sort_list
          elsif input == "q" || input == "Q"
            goodbye 
          else
            error
            show_list
          end
      elsif input == "s" || input == "S"
        sort_list 
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
    puts "Sorry, I don't understand. Please type again.".center(100, ' ').yellow
  end

  def goodbye
    puts "See you next time!".center(100, ' ').yellow
    sleep 1
    system("clear")
    exit
  end 

end


    