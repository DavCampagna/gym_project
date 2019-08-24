require_relative("../db/sql_runner")

class Member

  attr_reader :id
  attr_accessor :first_name, :last_name

  def initialize(details)
    @id = details["id"].to_i if details["id"]
    @first_name = details["first_name"]
    @last_name = details["last_name"]
  end

  def save()
    sql = "INSERT INTO members (first_name, last_name) VALUES ($1, $2) RETURNING id"
    values = [@first_name, @last_name]
    results = SqlRunner.run(sql, values)
    @id = results[0]['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM members"
    results = SqlRunner.run(sql)
    return results.map { |member| Member.new(member) }
  end

  def update()
    sql = "UPDATE members SET (first_name, last_name) = ($1, $2) WHERE id = $3"
    values = [@first_name, @last_name, @id]
    SqlRunner.run(sql, values)
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

end
