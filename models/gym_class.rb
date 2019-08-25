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

  def self.all()
    sql = "SELECT * FROM gym_classes"
    results = SqlRunner.run(sql)
    return results.map { |gym_class| GymClass.new(gym_class) }
  end

  def update()
    sql = "UPDATE gym_classes SET (name, capacity, time_slot) =($1, $2, $3) WHERE id = $4"
    values = [@name, @capacity, @time_slot, @id]
    SqlRunner.run(sql, values)
  end

  def self.delete_all
    sql = "DELETE FROM gym_classes"
    SqlRunner.run(sql)
  end

  def self.delete(id)
    sql = "DELETE FROM gym_classes WHERE id = $1"
    values = [id]
    SqlRunner.run(sql, values)
  end

  def members
  sql = "SELECT member.* FROM members member INNER JOIN bookings booking ON booking.member_id = member.id WHERE booking.gym_class_id = $1;"
  values = [@id]
  results = SqlRunner.run(sql, values)
  return results.map { |member| Member.new(member) }
  end

end
