require_relative('../db/sql_runner.rb')
require_relative('./city.rb')
require_relative('./country.rb')


class Destination

  attr_reader :name, :visited, :description, :id, :city_id

  def initialize(options)
    @name = options['name']
    @visited = options['visited']
    @description = options['description']
    @id = options['id'].to_i
    @city_id = options['city_id'].to_i
  end

  def save()
    sql = "INSERT INTO destinations(
      name ,
      visited,
      description,
    city_id)
      VALUES(
      $1, $2, $3, $4)
      RETURNING id"
    values = [@name, @visited, @description, @city_id]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def self.find(id)
    sql = "SELECT * FROM destinations
    WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql, values).first
    country = Destination.new(result)
    return country
  end

  def self.delete_all()
    sql = "DELETE FROM destinations"
    SqlRunner.run( sql )
  end

  def delete()
  sql = "DELETE FROM destinations
  WHERE id = $1"
  values = [@id]
  SqlRunner.run(sql, values)
  end

  def self.map_items(country_data)
    return destination_data.map { |destination| Destination.new(destination) }
  end

  def self.all()
    sql = "SELECT * FROM destinations"
    destination_data = SqlRunner.run(sql)
    destination = map_items(destination_data)
    return destination
  end

  def update()
    sql = "UPDATE destinations
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
    sql = "SELECT * FROM destinations WHERE visited = false"
    destination_data = SqlRunner.run(sql)
    visited_destinations = map_items(destination_data)
    return visited_destinations
  end

  def self.all_destinations_visited()
    sql = "SELECT * FROM destinations WHERE visited = true"
    destination_data = SqlRunner.run(sql)
    visited_destinations = map_items(country_data)
    return visited_destinations
  end

end
