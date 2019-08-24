require_relative("../models/gym_class")
require_relative("../models/member")
require_relative("../models/booking")
require("pry-byebug")

member1 = Member.new({
  "first_name" => "Lara",
  "last_name" => "Croft"
  })

member1.save

gym_class1 = GymClass.new({
  "name" => "yoga",
  "capacity" => 10,
  "time_slot" => "Midday"
  })

gym_class1.save

booking1 = Booking.new({
  "gym_class_id" => gym_class1.id,
  "member_id" => member1.id
  })

booking1.save

binding.pry
nil
