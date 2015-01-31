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
    coins = params[:coins]
    machine = Vending_Machine.new
    p machine.products[1].name
    # products = machine.buy(product, coins)
    erb :index
  end


run! if app_file == $0
end