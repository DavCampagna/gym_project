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

  def self.all()
    sql = "SELECT * FROM bookings"
    results = SqlRunner.run(sql)
    return results.map { |booking| Booking.new(booking) }
  end

  def self.delete_all
    sql = "DELETE FROM bookings"
    SqlRunner.run(sql)
  end

  def self.delete(id)
    sql = "DELETE FROM bookings WHERE id = $1"
    values = [id]
    SqlRunner.run(sql, values)
  end

# added later, test it
  def self.find(id)
    sql = "SELECT * FROM bookings WHERE id = $1"
    values = [id]
    results = SqlRunner.run(sql, values)
    return Booking.new(results[0])
  end
#######

  def member()
    sql = "SELECT * FROM members WHERE id = $1"
    values = [@member_id]
    results = SqlRunner.run(sql, values)
    return Member.new(results[0])
  end

  def gym_class()
    sql = "SELECT * FROM gym_classes WHERE id = $1"
    values = [@gym_class_id]
    results= SqlRunner.run(sql, values)
    return GymClass.new(results[0])
  end

  def self.already_booked?(member_id, gym_class_id)
    sql = "SELECT * FROM bookings WHERE (member_id, gym_class_id) = ($1, $2)"
    values = [member_id, gym_class_id]
    no_booking_found = SqlRunner.run(sql, values).first.nil?
    return !no_booking_found
  end

end
