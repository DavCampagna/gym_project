require_relative("../db/sql_runner")

class Member

  attr_reader :id
  attr_accessor :first_name, :last_name, :type

  def initialize(details)
    @id = details["id"].to_i if details["id"]
    @first_name = details["first_name"]
    @last_name = details["last_name"]
    @type = details["type"]
  end

  def save()
    sql = "INSERT INTO members (first_name, last_name, type) VALUES ($1, $2, $3) RETURNING id"
    values = [@first_name, @last_name, @type]
    results = SqlRunner.run(sql, values)
    @id = results[0]['id'].to_i
  end

  def update()
    sql = "UPDATE members SET (first_name, last_name, type) = ($1, $2, $3) WHERE id = $4"
    values = [@first_name, @last_name, @type, @id]
    SqlRunner.run(sql, values)
  end

  def self.all()
    sql = "SELECT * FROM members"
    results = SqlRunner.run(sql)
    return results.map { |member| Member.new(member) }
  end

  def self.delete_all
    sql = "DELETE FROM members"
    SqlRunner.run(sql)
  end

  def self.delete(id)
    sql = "DELETE FROM members WHERE id = $1"
    values = [id]
    SqlRunner.run(sql, values)
  end

  def self.find(id)
    sql = "SELECT * FROM members WHERE id = $1"
    values = [id]
    results = SqlRunner.run(sql, values)
    return Member.new(results[0])
  end

  def gym_classes
    sql = "SELECT gym_class.* FROM gym_classes gym_class INNER JOIN bookings booking ON booking.gym_class_id = gym_class.id WHERE booking.member_id = $1;"
    values = [@id]
    results = SqlRunner.run(sql, values)
    return results.map { |gym_class| GymClass.new(gym_class) }
  end

  def format_name
    return "#{@first_name.capitalize} #{@last_name.capitalize}"
  end

end
