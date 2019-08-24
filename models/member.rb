require_relative("../db/sql_runner")

class Member

  attr_reader :id
  attr_accessor :first_name, :last_name

  def initialize(details)
    @id = details["id"].to_i if details["id"]
    @first_name = details["first_name"]
    @last_name = details["last_name"]
  end

end
