require 'sinatra'
require "sinatra/reloader"
require './contact'
require	'./rolodex'


$rolodex = Rolodex.new
contact = $rolodex.find(1000)
	# $rolodex.add_contact(Contact.new("Johnny", "Bravo", "johnny@bitmakerlabs.com", "Rockstar"))


get '/' do
	@crm_name = "Dan Weinstock's CRM"
  erb :index
end

get '/contacts' do
	@contacts = $rolodex.contacts
	erb :contacts
end

get '/contacts/new' do
	erb :new
end

get "/contacts/:id" do
  @contact = $rolodex.find(params[:id].to_i)
  	if @contact
  		erb :show_contact
  	else
  		raise Sinatra::NotFound
		end
end

post '/contacts' do
	contact = Contact.new(params[:first_name], params[:last_name], params[:email], params[:note])
	$rolodex.add_contact(contact)
	redirect to('/contacts')
end