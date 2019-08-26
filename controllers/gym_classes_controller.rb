require("sinatra")
require("sinatra/contrib/all")

# require_relative("../models/booking.rb")
# require_relative("../models/member.rb")
require_relative("../models/gym_class.rb")
also_reload("../models/*")

get "/gym_classes" do
  @gym_classes = GymClass.all()
  erb(:"gym_classes/index")
end
