require("sinatra")
require("sinatra/contrib/all")

require_relative("../models/booking.rb")
require_relative("../models/member.rb")
require_relative("../models/gym_class.rb")
also_reload("../models/*")

get "/bookings" do
  erb(:"bookings/index")
end
