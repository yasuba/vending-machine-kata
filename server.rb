require 'sinatra/base'
require './lib/machine'
require './lib/product'

class VendingMachine < Sinatra::Base

  get '/' do
    # machine = Vending_Machine.new
    # product = params[:product]
    # coins = params[:coins]
    erb :index
  end

  post '/' do
    product = params[:product]
    coins = [params[:twohundred].to_i, params[:hundred].to_i, params[:fifty].to_i, params[:twenty].to_i, params[:ten].to_i, params[:five].to_i, params[:two].to_i, params[:one].to_i].inject(:+)
    @machine = Vending_Machine.new
    @items = @machine.buy(product, coins)
    erb :index
  end


run! if app_file == $0
end