class PostsController < ApplicationController

  get '/posts' do
    redirect_if_not_logged_in
    if current_user.posts != []
      @user_posts = current_user.posts.all
    end
    @posts = Post.all
    @name = current_user.name
    erb :"posts/index.html"
  end

  get '/posts/new' do
    redirect_if_not_logged_in
    @user = User.all
    erb :"posts/new.html"
  end

  post '/posts' do
    post = Post.new(params)
    post.user_id = session[:user_id]
    if post.save
      redirect "/posts/#{post.id}"
    else
      redirect "/posts/new"
    end
  end

  get '/posts/:id/edit' do
    redirect_if_not_logged_in
    @users = User.all
    this_post
    if @post.user.id == current_user.id
      erb :"posts/edit.html"
    else
      redirect "/posts"
    end
  end

  patch '/posts/:id' do
    this_post
    params.delete("_method")
    if @post.update(params)
      redirect "/posts/#{@post.id}"
    else
      redirect "/posts/#{@post.id}/edit"
    end
  end

  get '/posts/:id' do
    redirect_if_not_logged_in
    @post = Post.find_by_id(params["id"])
    erb :"posts/show.html"
  end

  delete '/posts/:id' do
    this_post
    if @post.user.id == current_user.id
      @post.destroy
      redirect "/posts"
    else
      redirect "/posts"
    end
  end

end
