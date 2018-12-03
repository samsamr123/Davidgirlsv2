require 'sinatra'
require 'pony'


set :port, 8080
# set :static, true
# set :public_folder, "public"
# set :views, "views"


Pony.options = {
  via: 'smtp',
  via_options: {
    address: 'smtp.mailgun.org',
    port: '587',
    enable_starttls_auto: true,
    authentication: 'plain',
    user_name: 'postmaster@sandboxeaaeb51af3a7415987e6d2c9460029ad.mailgun.org',
    password: 'bedb200c7b9b7689dfba848b617e9520-1053eade-038dccba'
  }
}

def send_email
  message = {
    from: 'example@hotmail.co.uk',
    to:'roisinwherry@hotmail.co.uk',
    subject: 'Welcome!',
    body: 'Thank you for signing up.'
  }

result=  Pony.mail(message)
puts result
end

get '/' do
  erb :index
end

post'/signup' do
  @name = params[:name]
  @email = params[:email]

  send_email

  erb :thanks
end

get '/blue' do
  erb :blue
end


get '/dynasties' do
  erb :dynasties
end

get '/earth' do
  erb :earth
end

get '/life' do
  erb :life
end
