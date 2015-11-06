class SessionsController < ApplicationController
  def new
  end

  def create
      @user = User.find_by(email: params[:email])
      if @user && @user.authenticate(params[:password])
          #set a cookie so our browser knows we are who we say we are
          session[:user_id] = @user.id.to_s
          redirect_to users_path
      else
          #give them another shot at loggin in
          #redirect_to "/"
      end
  end

   def destroy
     session[:user_id] = nil
    redirect_to root_url, notice: "logged out!"
   end
end
