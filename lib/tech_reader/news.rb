class TechReader::News
  attr_accessor :title, :author, :url

  def self.day
    self.scrape_news
  end

def self.scrape_news
    news = []
    news << self.scrape_cnet
    news << self.scrape_verge
    news << self.scrape_recode
    news
  end

def scrape_cnet
   doc = Nokogiri::HTML(open("https://www.cnet.com/apple/"))
   news = self.new
   news.title = doc.search("h2.assetBody").text
   news.author = doc.search("#topicListing span.assetAuthor").text
   news.url = doc.search("a").first.attr("href").strip
   news
 end


 def self.scrape_verge
    doc = Nokogiri::HTML(open("http://www.theverge.com/apple"))
    news = self.new
    news.title = doc.search("h2.c-entry-box--compact__title").text
    news.author = doc.search("span.c-byline__item").text
    news.url = doc.search("a").first.attr("href").strip
    news
  end

  def self.scrape_recode
    doc = Nokogiri::HTML(open("https://www.recode.net/apple"))
    news = self.new
    news.title = doc.search("h2.c-entry-box__title").text
    news.author = doc.search("span.c-byline__item").text
    news.url = doc.search("a").first.attr("href").strip
    news
  end
end
