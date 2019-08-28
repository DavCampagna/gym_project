require("sinatra")
require("sinatra/contrib/all")

require_relative("../models/booking.rb")
require_relative("../models/member.rb")
require_relative("../models/gym_class.rb")
also_reload("../models/*")

get "/gym_classes" do
  @gym_classes = GymClass.all()
  erb(:"gym_classes/index")
end

get "/gym_classes/new" do
  erb(:"gym_classes/new")
end

post "/gym_classes" do
  @gym_class = GymClass.new(params)
  @gym_class.save
  erb(:"gym_classes/create")
end

# the above finds the gym_class id, I should use it later

get "/gym_classes/:id" do
  @gym_class = GymClass.find(params[:id])
  erb(:"gym_classes/show")
end

get "/gym_classes/:id/edit" do
  @gym_class = GymClass.find(params[:id])
  erb(:"gym_classes/edit")
end

post "/gym_classes/:id" do
  GymClass.new(params).update
  redirect to "/gym_classes"
end

post "/gym_classes/:id/delete" do
  @gym_class = GymClass.find(params[:id])
  GymClass.delete(params[:id])
  redirect to "/gym_classes"
end

get "/gym_classes/:id/attendees" do
  @gym_class = GymClass.find(params[:id])
  erb(:"gym_classes/attendees")
end
