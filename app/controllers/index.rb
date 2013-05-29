get '/' do
  # render home page
 #TODO: Show all users if user is signed in
 @users = User.all



 erb :index
end

#----------- SESSIONS -----------

get '/sessions/new' do
  # render sign-in page 
  erb :sign_in
end

post '/sessions' do
  authenticate(params[:email], params[:password])
  # sign-in
end

delete '/sessions/:id' do
  # sign-out -- invoked via AJAX
  session.clear
  redirect '/'
end

#----------- USERS -----------

get '/users/new' do
  # render sign-up page
  erb :sign_up
end

post '/users' do
  # sign-up a new user


  @user = User.create(params['user'])

  session[:user_id] = @user.id

  
  redirect '/'
end
