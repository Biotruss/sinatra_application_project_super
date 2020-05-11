class UsersController < ApplicationController

  get "/signup" do
    redirect_if_logged_in
    erb :'/users/signup.html'
  end

  post "/users" do
    @user = User.new(params)
    if @user && @user.save
      session[:user_id] = @user.id
      redirect "/posts"
    else
      erb :"users/signup.html"
    end
  end

end
