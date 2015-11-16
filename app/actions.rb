# Homepage (Root path)

#adding helper to access sinatra's sessions to identify user just created
helpers do
  def current_user
    @current_user = User.find_by(id: session[:user_id]) if session[:user_id]
  end

end

get '/' do
  erb :index
end

get '/login' do
  erb :login
end

post '/signup' do
  username = params[:username]
  password = params[:password]
  email =    params[:email]

  email = User.find_by(email: email)
  username = User.find_by(username: username)
  if (user.email == email) || (user.username == username)
    redirect '/login'
  else 
    user= user.create(username:username, password:password, email:email)
    session[:user_id] = user.id
    redirect '/profile'
  end
    
    
end

post '/login' do
  username = params[:username]
  password = params[:password]

  user = User.find_by(username: username)
  if user.password == password 
    session[:user_id] = user.id 
    
  else 
    redirect '/'
  end
end

