require("sinatra")
require("sinatra/contrib/all")

require_relative("../models/booking.rb")
require_relative("../models/member.rb")
require_relative("../models/gym_class.rb")
also_reload("../models/*")

get "/bookings" do
  @bookings = Booking.all()
  @members = Member.all()
  erb(:"bookings/index")
end

get "/bookings/new" do
  @members = Member.all
  @gym_classes = GymClass.all
  erb(:"bookings/new")
end

post "/bookings" do
  booking = Booking.new(params)
  booking.save
  erb(:"bookings/create")
end

get "/bookings/:id" do
  @booking = Booking.find(params[:id])
  erb(:"bookings/show")
end

get "/bookings/:id/edit" do
  @booking = Booking.find(params[:id])
  erb(:"bookings/edit")
end

post "/bookings/:id" do
  Booking.new(params).update
  redirect to "/bookings"
end

# post "/bookings/:id/delete" do
#   @booking = Booking.find(params[:id])
#   Booking.delete(params[:id])
#   redirect to "/bookings"
# end
