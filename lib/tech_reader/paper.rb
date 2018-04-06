class TechReader::Paper
  attr_accessor :title, :author, :summary, :url

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
   paper.title = doc.search("#topicListing h2").text
   paper.author = doc.search("span.assetAuthor").text
   paper.summary = doc.search("dek p").text
   paper.url = doc.search("a").first.attr("href").strip
   paper
 end

  def self.scrape_recode
    doc = Nokogiri::HTML(open("https://www.recode.net/apple"))
    paper = self.new
    paper.title = doc.search(".c-entry-box--compact__title h2").text
    paper.author = doc.search("span.c-byline__item a").text
    paper.summary = []
    paper.url = doc.search("a").first.attr("href").strip
    paper
  end
end
