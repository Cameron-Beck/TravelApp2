require_relative('../models/city.rb')
require_relative('../models/country.rb')
require_relative('../models/destination.rb')

City.delete_all()
Country.delete_all()
Destination.delete_all()

country1 = Country.new({
  "name" => "England",
  "visited" => true,
  "description" => "A misserable, seemingly post apocalyptic hellscape"
  })
  country1.save()

country2 = Country.new({
  "name" => "France",
  "visited" => false,
  "description" => "A misserable, seemingly post apocalyptic hellscape"
  })
  country2.save()

country3 = Country.new({
  "name" => "Italy",
  "visited" => true,
  "description" => "A misserable, seemingly post apocalyptic hellscape"
  })
  country3.save()

country4 = Country.new({
  "name" => "Germany",
  "visited" => false,
  "description" => "A misserable, seemingly post apocalyptic hellscape"
  })
  country4.save()

city1 = City.new({
  "name" => "London",
  "visited" => true,
  'country_id' => country1.id,
  "description" => "like this place"
  })
  city1.save()

city2 = City.new({
  "name" => "Paris",
  "visited" => false,
  'country_id' => country2.id,
  "description" => "like this place"
  })
  city2.save()

city3 = City.new({
  "name" => "Rome",
  "visited" => true,
  'country_id' => country3.id,
  "description" => "like this place"
  })
  city3.save()

city4 = City.new({
  "name" => "Berlin",
  "visited" => false,
  'country_id' => country4.id,
  "description" => "like this place"
  })
  city4.save()

  destination1 = Destination.new({
    "name" => "Big Ben",
    "visited" => false,
    'city_id' => city1.id,
    "description" => "big Ben is good"
    })
    destination1.save()
