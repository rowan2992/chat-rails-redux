class Api::V1::MessagesController < ApplicationController
  before_action :set_channel

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
    
    message = @channel.messages.build(content: params[:content])
    message.user = current_user
    message.save
    render json: message # see Message.as_json method

  end

  private

  def set_channel
    @channel = Channel.find_by(name: params[:channel_id])
  end
  
  def find_author(id)
    User.find(id).email
  end

  def message_params
    params.require(:message).permit(:content)
  end
end
