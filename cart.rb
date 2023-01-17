require "csv"
require "json"
require "./item.rb"

class Cart
    def save_to_csv()
        items = Item.get_All()
		File.new("./out/out.csv", "w+")

		CSV.open("./out/out.csv", "w+",
			:write_headers=> true,
			:headers => ["id","name","priceUSD", "mileage", "city", "owner name", "link", "description"]) do |csv|
				items.each do |element|
                    csv << element.to_s()
				end
			end
            puts "CSV file is generated successfuly"
		end
	def save_to_json()
		items = Item.get_All()

		if items.length() == 0 
			raise StandardError.new "Parse failed"
		end

		File.new("./out/out.json", "w+")

		File.open("./out/out.json", "w+") do |json|
			items_array = []
			items.each do |element|
				items_array.push(element.to_h())
			end
			json.write(JSON.generate({'data': items_array}))
		end


		puts "JSON file is generated successfuly"
	end
end
