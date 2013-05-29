helpers do

  def current_user

    if session[:user_id]
      @current_user = User.find(session[:user_id])
    end
    @current_user
    
  end

end


  def authenticate(email, password)
    @user = User.find_by_email(params[:email])
    if @user
      
      if @user.password == params[:password]
        session[:user_id] = @user.id
        redirect "/"
      else
        @errors = "The email or password is incorrect."
        erb :sign_in
      end
    else
        @errors = "Email does not exist."
        erb :sign_in
    end
end
