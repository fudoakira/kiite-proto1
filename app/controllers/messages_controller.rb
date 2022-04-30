class MessagesController < ApplicationController

  before_action :authenticate_user!, only: [:create]

  def create
    if RoomUser.where(profile_id: current_user.id, room_id: params[:message][:room_id]).present?
      @message = Message.create!(params.require(:message).permit(:profile_id, :message, :room_id).merge(profile_id: current_user.id))
      redirect_to room_path(@message.room_id)
    else
      flash[:alert] = "メッセージを送信できませんでした"
    end
  end
end
