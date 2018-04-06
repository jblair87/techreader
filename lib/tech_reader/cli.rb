class TechReader::CLI
  def call
    start
  end

  def list_papers
      puts "Today's Apple News"
        puts ""
        @papers = TechReader::Paper.today
        @papers.each.with_index do |paper, i|
        puts "#{i}. #{paper.title}"
      end
    end
def print_paper(paper)
  puts "-------------- #{paper.title} --------------"
  puts "#{paper.author}"
  puts "#{paper.summary}"
end

    def start
      list_papers
      input = nil
      while input != "exit"
        puts "What news would you like more info on, by number?"
        puts "Enter list to see the list again."
        puts "Enter exit to end the program."
        input = gets.strip
      if input == "list"
        list_papers
      elsif input.to_i > 0
        if paper = TechReader::Paper.find_by(input.to_i)
          print_paper(paper)
        end
      end
    end
        puts "Goodbye"
      end
    end
