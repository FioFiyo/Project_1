

#adding helper to access sinatra's sessions to identify user just created.
#id is specific to each user and the easiest way to get 'em for logins and creating one.
#use instance variable so it can bee seen in views.
# ||= means only set the parameters after = if current_user is nil at the moment.
helpers do
  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

end
# Homepage (Root path)
get '/' do
  erb :index
end

get '/login' do
  erb :login
end

get '/signup' do
  erb :signup
end

get '/profile' do
  erb :profile
end


# Logout
get '/logout' do 
  session[:user_id] = nil
  redirect '/'
  #put nil or session.clear
end

#setting up user; set up the variables first.
post '/signup' do
  username = params[:username]
  password = params[:password]
  email =    params[:email]

  # user = User.new (username: username, password: password, email: email)

  email = User.find_by(email: email)#wouldn't i use params[:email] to find it?
  username = User.find_by(username: username)
  if (user.email == email) || (user.username == username)
    redirect '/login'
  else 
    user= User.create(username:username, password:password, email:email)
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

