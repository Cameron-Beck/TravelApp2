require_relative('../db/sql_runner.rb')

class City

  attr_reader :name, :visited, :id, :country_id

  def initialize(options)
    @id = options['id'].to_i
    @country_id = options['country_id'].to_i
    @name = options['name']
    @visited = options['visited']
  end

  def save()
    sql = "INSERT INTO city (
      name,
      visited,
      country_id)
      VALUES(
      $1, $2, $3)
      RETURNING id"
    values = [@name, @visited, @country_id]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def self.delete_all()
    sql = "DELETE FROM city"
    SqlRunner.run( sql )
  end

  def delete()
  sql = "DELETE FROM city
  WHERE id = $1"
  values = [@id]
  SqlRunner.run(sql, values)
  end

  def self.all()
    sql = "SELECT * FROM city"
    city_data = SqlRunner.run(sql)
    cities = map_items(city_data)
    return cities
  end

  def self.find(id)
    sql = "SELECT * FROM city
    WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql, values).first
    city = City.new(result)
    return city
  end

  def self.cities_by_country()
    sql = "SELECT * FROM city @ID"
    city_data = SqlRunner.run(sql)
    cities = map_items(city_data)
    return cities
  end

  def self.map_items(city_data)
    return city_data.map { |city| City.new(city) }
  end

end
