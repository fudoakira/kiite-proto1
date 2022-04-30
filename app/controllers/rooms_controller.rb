class RoomsController < ApplicationController

  before_action :authenticate_user!

  def create
    @room = Room.create
    @roomUser1 = RoomUser.create(room_id: @room.id, profile_id: current_user.id)
    @roomUser2 = RoomUser.create(params.require(:room_user).permit(:profile_id, :room_id).merge(room_id: @room.id))
    redirect_to room_path(@room.id)
  end

  def show
    @room = Room.find(params[:id])
    if RoomUser.where(profile_id: current_user.id, room_id: @room.id).present?
      @messages = @room.messages
      @message = Message.new
      @roomUsers = @room.room_users
    else
      redirect_back(fallback_location: root_path)
    end
  end
end
