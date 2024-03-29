require("sinatra")
require("sinatra/contrib/all")

require_relative("../models/booking.rb")
require_relative("../models/member.rb")
require_relative("../models/gym_class.rb")
also_reload("../models/*")

get "/members" do
  @members = Member.all()
  erb(:"members/index")
end

get "/members/new" do
  erb(:"members/new")
end

post "/members" do
  @member = Member.new(params)
  @member.save
  erb(:"members/create")
end

# fix the above.. Also, mind the order of execution

get "/members/edit" do
  @members = Member.all()
  erb(:"members/edit_menu")
end

get "/members/delete" do
  @members = Member.all()
  erb(:"members/delete_menu")
end

############################################

get "/members/:id" do
  @member = Member.find(params[:id])
  erb(:"members/show")
end

get "/members/:id/edit" do
  @member = Member.find(params[:id])
  erb(:"members/edit")
end

post "/members/:id" do
  Member.new(params).update
  redirect to "/members"
end

post "/members/:id/delete" do
  @member = Member.find(params[:id])
  Member.delete(params[:id])
  redirect to "/members"
end
