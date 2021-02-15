class Api::V1::MessagesController < ApplicationController
 

  def index
    @messages = Message.joins(:channel).where(channel: { name: params[:channel_id] })
    render json: @messages
  end

  def create
  end


end
