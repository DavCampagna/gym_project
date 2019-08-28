require_relative("../models/gym_class")
require_relative("../models/member")
require_relative("../models/booking")
require("pry-byebug")

Booking.delete_all()
Member.delete_all()
GymClass.delete_all()

member1 = Member.new({
  "first_name" => "Arnold",
  "last_name" => "Schwarzenegger",
  "type" => "Premium"
  })

member1.save

member2 = Member.new({
  "first_name" => "Lara",
  "last_name" => "Croft",
  "type" => "Premium"
  })

member2.save

member3 = Member.new({
  "first_name" => "Mahatma",
  "last_name" => "Gandhi",
  "type" => "Premium"
  })

member3.save

member4 = Member.new({
  "first_name" => "Elizabeth",
  "last_name" => "Windsor",
  "type" => "Premium"
  })

member4.save

member5 = Member.new({
  "first_name" => "Frida",
  "last_name" => "Kahlo",
  "type" => "Standard"
  })

member5.save

member6 = Member.new({
  "first_name" => "Tom",
  "last_name" => "Waits",
  "type" => "Standard"
  })

member6.save

member7 = Member.new({
  "first_name" => "Virginia",
  "last_name" => "Wolf",
  "type" => "Standard"
  })

member7.save

member8 = Member.new({
  "first_name" => "Chris",
  "last_name" => "Haining",
  "type" => "Standard"
  })

member8.save

gym_class1 = GymClass.new({
  "name" => "Yoga",
  "capacity" => 12,
  "time_slot" => "8 AM"
  })

gym_class1.save

gym_class2 = GymClass.new({
  "name" => "Spin",
  "capacity" => 10,
  "time_slot" => "11 AM"
  })

gym_class2.save

gym_class3 = GymClass.new({
  "name" => "Karate",
  "capacity" => 16,
  "time_slot" => "2 PM"
  })

gym_class3.save

gym_class4 = GymClass.new({
  "name" => "Body Pump",
  "capacity" => 25,
  "time_slot" => "5 PM"
  })

gym_class4.save

gym_class5 = GymClass.new({
  "name" => "Kickboxing",
  "capacity" => 20,
  "time_slot" => "8 PM"
  })

gym_class5.save

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

booking3 = Booking.new({
  "gym_class_id" => gym_class4.id,
  "member_id" => member4.id
  })

booking3.save

booking4 = Booking.new({
  "gym_class_id" => gym_class2.id,
  "member_id" => member1.id
  })

booking4.save

booking5 = Booking.new({
  "gym_class_id" => gym_class2.id,
  "member_id" => member3.id
  })

booking5.save

booking6 = Booking.new({
  "gym_class_id" => gym_class4.id,
  "member_id" => member2.id
  })

booking6.save

binding.pry
nil
