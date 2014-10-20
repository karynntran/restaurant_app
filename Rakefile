require 'bundler'
Bundler.require

require 'sinatra/activerecord/rake'
require_relative 'connection.rb'

namespace :db do
  desc "Create restaurant_db database"
  task :create_db do
    conn = PG::Connection.open()
    conn.exec('CREATE DATABASE restaurant_db;')
    conn.close
  end

  desc "Drop restaurant_db database"
  task :drop_db do
    conn = PG::Connection.open()
    conn.exec('DROP DATABASE restaurant_db;')
    conn.close
  end

  desc "create junk data for development"
  task :junk_data do

    require_relative 'connection'
    require_relative 'models/food'
    require_relative 'models/party'
    require_relative 'models/order'

 	Food.create({name: 'Pad Thai', cuisine: "Thai", price: 12})
    Food.create({name: 'Lumpia', cuisine: "Filipino", price: 6})
    Food.create({name: 'Spicy Tuna Rolls', cuisine: "Japanese", price: 13})
    Food.create({name: 'Spaghetti and Meatballs', cuisine: "Italian", price: 12})
    Food.create({name: 'Paella', cuisine: "Spanish", price: 16})
    Food.create({name: 'Escargot', cuisine: "French", price: 17})

    Party.create({party_name: 'Dothraki',  guest_num: 1000, paid: 'false'})
    Party.create({party_name: 'Starks',  guest_num: 8, paid: 'false'})
    Party.create({party_name: 'Baratheon', guest_num: 6, paid: 'false'})
    Party.create({party_name: 'Lannister',  guest_num: 6, paid: 'false'})
    Party.create({party_name: 'Targaryen', guest_num: 10, paid: 'false'})
    Party.create({party_name: 'Tran', guest_num: 6, paid: 'false'})
   end

   desc "delete all generated receipts"
  	task :delete_receipts do
  end
end 