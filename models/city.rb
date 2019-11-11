require_relative('../db/sql_runner.rb')

class City

  attr_reader :name, :visited, :id, :country_id, :description

  def initialize(options)
    @id = options['id'].to_i
    @country_id = options['country_id'].to_i
    @name = options['name']
    @visited = options['visited']
    @description = options['description']
  end

  def save()
    sql = "INSERT INTO cities (
      name,
      visited,
      description,
      country_id
    )
      VALUES(
      $1, $2, $3, $4)
      RETURNING id"
    values = [@name, @visited, @description, @country_id]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def self.delete_all()
    sql = "DELETE FROM cities"
    SqlRunner.run( sql )
  end

  def delete()
  sql = "DELETE FROM cities
  WHERE id = $1"
  values = [@id]
  SqlRunner.run(sql, values)
  end

  def self.all()
    sql = "SELECT * FROM cities"
    city_data = SqlRunner.run(sql)
    cities = map_items(city_data)
    return cities
  end

  def self.find(id)
    sql = "SELECT * FROM cities
    WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql, values).first
    city = City.new(result)
    return city
  end

  def update()
    sql = "UPDATE cities
    SET(
      name,
      description,
      visited)
      = ($1, $2, $3)
    WHERE id = $4"
    values = [@name, @description, @visited, @id]
    SqlRunner.run(sql, values)
  end

  def self.cities_by_country()
    sql = "SELECT * FROM cities @ID"
    city_data = SqlRunner.run(sql)
    cities = map_items(city_data)
    return cities
  end

  def self.map_items(city_data)
    return city_data.map { |city| City.new(city) }
  end

end
