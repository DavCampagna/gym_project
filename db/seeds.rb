require_relative("../models/gym_class")
require_relative("../models/member")
require_relative("../models/booking")
require("pry-byebug")

member1 = Member.new({
  "first_name" => "Lara",
  "last_name" => "Croft"
  })

member1.save

member2 = Member.new({
  "first_name" => "Arnold",
  "last_name" => "schwarzenegger"
  })

member2.save

gym_class1 = GymClass.new({
  "name" => "yoga",
  "capacity" => 10,
  "time_slot" => "Midday"
  })

gym_class1.save

gym_class2 = GymClass.new({
  "name" => "kickboxing",
  "capacity" => 15,
  "time_slot" => "8 PM"
  })

gym_class2.save

booking1 = Booking.new({
  "gym_class_id" => gym_class1.id,
  "member_id" => member1.id
  })

booking1.save

booking2 = Booking.new({
  "gym_class_id" => gym_class1.id,
  "member_id" => member2.id
  })

booking2.save

binding.pry
nil
