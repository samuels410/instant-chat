class MessagesController < ApplicationController

  before_filter :require_user

  def index
    @messages = Message.last(15)
    @users = User.where(id: (ActiveUser.all.collect(&:user_id) - [@current_user.id]))
  end

  def create
    @message = @current_user.messages.create(params[:message])
    PrivatePub.publish_to("/messages/new", message: @message)
  end

end
