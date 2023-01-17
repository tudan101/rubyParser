require "byebug"
require "open-uri"
require "nokogiri"
require "./item.rb"

class Parser
    def initialize(url)
        puts "Start parsing #{url}";
		@url = url
    end

    def parse()
        begin
            html = URI.open(@url) { |result| result.read}
            doc = Nokogiri::HTML(html)
            index = 0
            doc.css(".ticket-item").each do |element|
                item = Item.new()
                item.name = element.css(".blue.bold").text.strip!
                item.priceUSD = element.css(".price-ticket").css(".bold.size22.green").text.sub("$", "").gsub(/\s+/, "").to_i
                item.mileage = element.css(".item-char.js-race").text.strip!
                item.city = element.css(".item-char.view-location.js-location").text.gsub(" ( від )", "").strip!
                link = element.css(".address").map { |link| link["href"] }[0]
                item.link = link
                
                item_html = URI.open(link) { |result| result.read}
                item_doc = Nokogiri::HTML(item_html)
                item.ownerName = item_doc.css("#userInfoBlock .seller_info_name.bold").text.strip!
                item.description = item_doc.css(".description-container").text
                item.id = index+1
                index= index+1
                Item.push(item)
            end
        rescue OpenURI::HTTPError => e
            puts e.message
        end
    end
end
