require_relative('../db/sql_runner.rb')
require_relative('./city.rb')
class Country

  attr_reader :name, :visited, :description, :id

  def initialize(options)
    @name = options['name']
    @visited = options['visited']
    @description = options['description']
    @id = options['id'].to_i
  end

  def save()
    sql = "INSERT INTO countries(
      name ,
      visited,
      description)
      VALUES(
      $1, $2, $3)
      RETURNING id"
    values = [@name, @visited, @description]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def self.find(id)
    sql = "SELECT * FROM countries
    WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql, values).first
    country = Country.new(result)
    return country
  end

  def self.delete_all()
    sql = "DELETE FROM countries"
    SqlRunner.run( sql )
  end

  def delete()
  sql = "DELETE FROM countries
  WHERE id = $1"
  values = [@id]
  SqlRunner.run(sql, values)
  end

  def self.map_items(country_data)
    return country_data.map { |country| Country.new(country) }
  end

  def self.all()
    sql = "SELECT * FROM countries"
    country_data = SqlRunner.run(sql)
    countries = map_items(country_data)
    return countries
  end

  def update()
    sql = "UPDATE countries
    SET(
      name,
      description,
      visited)
      = ($1, $2, $3)
    WHERE id = $4"
    values = [@name, @description, @visited, @id]
    SqlRunner.run(sql, values)
  end

  def self.all_bucket_list()
    sql = "SELECT * FROM countries WHERE visited = false"
    country_data = SqlRunner.run(sql)
    visited_countries = map_items(country_data)
    return visited_countries
  end

  def self.all_countries_visited()
    sql = "SELECT * FROM countries WHERE visited = true"
    country_data = SqlRunner.run(sql)
    visited_countries = map_items(country_data)
    return visited_countries
  end

  def cities()
    sql = "SELECT * FROM cities WHERE country_id = $1"
    values = [@id]
    city_data = SqlRunner.run(sql, values)
    cities = city_data.map{|city| City.new(city)}
    return city_data
  end

end
