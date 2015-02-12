require 'sinatra/base'
require 'unirest'
require './lib/machine'
require './lib/product'

class VendingMachine < Sinatra::Base

  get '/' do
    response = Unirest.get "https://nijikokun-random-cats.p.mashape.com/random/kitten",
    headers:{
      "X-Mashape-Key" => "LIuts2IADNmsh5YOdmofLapYJhNXp1j7vryjsnvW5S15LHWOSF",
      "Accept" => "application/json"
    }

    @source = response.body['source']
    erb :index
  end

  post '/' do
    response = Unirest.get "https://nijikokun-random-cats.p.mashape.com/random/kitten",
    headers:{
      "X-Mashape-Key" => "LIuts2IADNmsh5YOdmofLapYJhNXp1j7vryjsnvW5S15LHWOSF",
      "Accept" => "application/json"
    }
    @source = response.body['source']
    coins = [params[:twohundred].to_i, params[:hundred].to_i, params[:fifty].to_i, params[:twenty].to_i, params[:ten].to_i, params[:five].to_i, params[:two].to_i, params[:one].to_i].inject(:+)
    machine = Vending_Machine.new
    @change = machine.give_change(params[:kitkat], params[:twirl], params[:cola], params[:walkers], coins)
    @items = machine.buy(params[:kitkat], params[:twirl], params[:cola], params[:walkers], coins)
    erb :index
  end


run! if app_file == $0
end