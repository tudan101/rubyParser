class Item
  @@items = []

  attr_accessor :id, :name, :priceUSD, :mileage, :city, :ownerName, :link, :description

  def initialize(id = 0, name ="", priceUSD = 0, mileage = 0, city = "", ownerName = "", link = "", description = "")
      @id = id
      @name = name
      @priceUSD = priceUSD
      @mileage = mileage
      @city = city
      @ownerName = ownerName
      @link = link,
      @description = description
  end

  def self.push(item)
      @@items.push(item)
  end

  def self.get_All()
      @@items
  end

  def to_s()
      [@id, @name, @priceUSD, @mileage, @city, @ownerName, @link, @description]
  end

  def to_h()
      {
          "id" => @id, 
          "name"=> @name, 
          "priceUSD" => @priceUSD, 
          "mileage" => @mileage, 
          "city" => @city,
          "ownerName" => @ownerName,
          "link" => @link,
          "description" => @description
      }
  end

end
