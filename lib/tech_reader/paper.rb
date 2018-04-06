class TechReader::Paper
  attr_accessor :title, :author, :url

  def self.today
    self.scrape_papers
  end

def self.scrape_papers
    papers = []
    papers << self.scrape_cnet
    papers << self.scrape_recode
    papers
  end

def self.scrape_cnet
   doc = Nokogiri::HTML(open("https://www.cnet.com/apple/"))
   paper = self.new
   paper.title = doc.search("#topicListing h2.assetBody").text
   paper.author = doc.search("#topicListing span.assetAuthor").text
   paper.url = doc.search("a").first.attr("href").strip
   paper
 end

  def self.scrape_recode
    doc = Nokogiri::HTML(open("https://www.recode.net/apple"))
    paper = self.new
    paper.title = doc.search("h2.c-entry-box__title").text
    paper.author = doc.search("span.c-byline__item").text
    paper.url = doc.search("a").first.attr("href").strip
    paper
  end
end
