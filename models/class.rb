require_relative("../db/sql_runner")

class Class

  attr_reader :id,
  attr_accessor :name, :capacity, :time_slot

  def initialize(details)
    @id = details["id"].to_i if details["id"]
    @name = details["name"]
    @capacity = details["capacity"]
    @time_slot = details["time_slot"]
  end

end
