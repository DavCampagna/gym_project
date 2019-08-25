require("sinatra")
require("sinatra/contrib/all")

# require_relative("../models/booking.rb")
require_relative("../models/member.rb")
# require_relative("../models/gym_class.rb")
also_reload("../models/*")

get "/members" do
  @members = Member.all()
  erb(:"members/index")
end

get "/members/:id" do
  @member = Member.find(params['id'].to_i)
  erb(:"members/show")
end
