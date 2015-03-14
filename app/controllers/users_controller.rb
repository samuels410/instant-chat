class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save(validate: false)
      current_user.move_to(@user) if current_user && current_user.guest?
      session[:user_id] = @user.id
      ActiveUser.create(user_id: @user.id)
      PrivatePub.publish_to("/meta/user_connect", session_id: session[:user_id])
      redirect_to messages_url
    else
      render "new"
    end
  end

  def update
    @preferred_action = params[:user_action]
    PrivatePub.publish_to("/app/publish_users", user: current_user,action: @preferred_action)
  end

end
