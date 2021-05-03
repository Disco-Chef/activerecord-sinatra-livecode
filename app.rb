require_relative "config/application"
require "sinatra"
require "sinatra/reloader"
require "sinatra/activerecord"

get "/" do
  "Goodbye world!"
end

get "/restaurants" do
  @restaurants = Restaurant.all
  erb :index
end

# The user is on /restaurants/3, for example
# We need to find the instance, something like Restaurant.find(3)
# But the id? Where do we get that id?

# params => a hash that stores information of a request.
#       You can access it on any page, and any key it 
#               has with `params[key]`   🤯

# params = {
#   id: 3
# }
# id = params[:id]
get "/restaurants/:id" do
  @restaurant = Restaurant.find(params[:id])
  erb :show
end

# params => hash that stores information of a request.
#          In the case of submitting a form, the params
#       hash is storing the various form inputs (based on name). 
#      You can access each of those with `params["key_name"]`
#          (look at the form element in index.erb)

# params => {"name"=>"Excelsior", "city"=>"London"}
post "/restaurants" do
  name = params["name"]
  city = params["city"]
  restaurant = Restaurant.create(name: name, city: city)

  redirect "/restaurants/#{restaurant.id}"
end
