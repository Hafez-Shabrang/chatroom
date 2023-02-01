class ChatroomController < ApplicationController

  before_action :require_login, only: [:home, :chatroom]

  def home
    @messages = Message.all
    @users = User.all
  end

  def chatroom
    message = Message.new(body: params[:body], user_id: current_user.id)
    if message.save
      ActionCable.server.broadcast("chatroom_channel", render_message(message))
      # render "chatroom/home"
      # redirect_to root_path
    # else
    #   render "chatroom/home"
    end
  end

  def clear
    Message.destroy_all
    redirect_to root_path
  end


  private

  def render_message(message)
    render(partial: "chatroom/message", locals: {message: message})
  end
  
end
