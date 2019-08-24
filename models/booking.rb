require_relative("../db/sql_runner")

class Booking

  attr_reader :id, :class_id, :member_id

  def initialize(details)
    @id = details["id"].to_i if details["id"]
    @class_id = details["class_id"].to_i
    @member_id = details["member_id"].to_i
  end

end 
