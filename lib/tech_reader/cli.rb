class TechReader::CLI
  def call
    list_news
    menu
  end
  def list_news
      puts "Today's Apple News"
      @news = TechReader::News.today
      @news.each.with_index(1) do |news, i|
        puts "#{i}. #{news.title} - #{news.author}"
      end
    end

    def menu
      input = nil
      while input != "exit"
        puts "type list to see the deals again or type exit:"
        input = gets.strip.downcase

        if input.to_i > 0
          the_news = @news[input.to_i-1]
          puts "#{the_news.title} - #{the_news.author}"
        elsif input == "list"
          list_news
        else
          puts "Not sure what you want, type list or exit."
        end
      end
    end
end
