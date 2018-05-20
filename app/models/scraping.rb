class Scraping
  def self.movie_urls
    links = []
    agent = Mechanize.new
    current_page = agent.get("https://syllabus.thu.ac.jp/campusweb/slbsskgr.do")
    elements = current_page.search('column_odd a')
    elements.each do |ele|
      links << ele.get_attribute('href')
    end

    links.each do |link|
      get_product('https://syllabus.thu.ac.jp/campusweb/slbsskgr.do' + link)
    end
  end

  def self.get_product(link)
    agent = Mechanize.new
    page = agent.get(link)
    name = page.at('.item').inner_text
    
    image_url = page.at('.entry-content img')[:src] if page.at('.entry-content img')

    product = Product.new(title: title, image_url: image_url)
    product.save
  end
end