class Api::V1::MessagesController < ApplicationController
 
  def index
    messages = Message.joins(:channel).where(channel: { name: params[:channel_id] })
    
    messages_json = messages.map do |message|
      {
        id: message.id,
        author: find_author(message.user_id),
        content: message.content,
        created_at: message.created_at
      }
    end
    render json: messages_json
  end

  def create
  end

  def find_author(id)
    User.find(id).email
  end
end
