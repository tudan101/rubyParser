require "csv"
require "./parser.rb"
require "./cart.rb"

default_uri = "https://auto.ria.com/uk/search/?categories.main.id=1&indexName=auto,order_auto,newauto_search&brand.id[0]=58&year[0].gte=2015&year[0].lte=2018&size=20"

if ARGV.length > 0
	uri = ARGV[0]
end

parser = Parser.new(uri)
cart = Cart.new()

parser.parse()

cart.save_to_csv()
cart.save_to_json()
