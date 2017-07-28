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
   news.title =
   news.author =
   news.url =
   news
 end


 def self.scrape_verge
    doc = Nokogiri::HTML(open("http://www.theverge.com/apple"))
    news = self.new
    news.title =
    news.author =
    news.url =
    news
  end

  def self.scrape_recode
    doc = Nokogiri::HTML(open("https://www.recode.net/apple"))
    news = self.new
    news.title =
    news.author =
    news.url =
    news
  end
end
