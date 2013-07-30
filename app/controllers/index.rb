require 'etsy'
require_relative '../models/response'

Etsy.environment = :production
Etsy.api_key = 'ybq5nonin7ip8osks75cvkr0'


get '/' do
  # Look in app/views/index.erb
  erb :index

end

post '/users' do
	@user = Etsy.user(params[:user_name])
  @listings = Etsy::Listing.find_all_by_shop_id(@user.shop.id, :limit => 5)
  erb :user_show
end

post '/shops' do
	@shop = Etsy::Shop.find(params[:shop_name])
  @listings = Etsy::Listing.find_all_by_shop_id(@shop.id, :limit => 5)
  erb :shop_show
end

