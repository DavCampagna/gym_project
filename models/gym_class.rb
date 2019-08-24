require_relative("../db/sql_runner")

class GymClass

  attr_reader :id
  attr_accessor :name, :capacity, :time_slot

  def initialize(details)
    @id = details["id"].to_i if details["id"]
    @name = details["name"]
    @capacity = details["capacity"].to_i
    @time_slot = details["time_slot"]
  end

  def save()
    sql = "INSERT INTO gym_classes (name, capacity, time_slot) VALUES ($1, $2, $3) RETURNING id"
    values = [@name, @capacity, @time_slot]
    results = SqlRunner.run(sql, values)
    @id = results[0]['id'].to_i
  end

end
