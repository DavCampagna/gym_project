require_relative("../db/sql_runner")

class Booking

  attr_reader :id, :gym_class_id, :member_id

  def initialize(details)
    @id = details["id"].to_i if details["id"]
    @gym_class_id = details["gym_class_id"].to_i
    @member_id = details["member_id"].to_i
  end

  def save()
    sql = "INSERT INTO bookings (gym_class_id, member_id) VALUES ($1, $2) RETURNING id"
    values = [@gym_class_id, @member_id]
    results = SqlRunner.run(sql, values)
    @id = results[0]['id'].to_i
  end

end
