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

end
