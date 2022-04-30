class ProfilesController < ApplicationController
  before_action :set_profile, only: [:show, :edit, :update, :destroy]
  def index
    @profiles = Profile.all
    @tag_list = Tag.all
  end

  def new
    @profile = Profile.new
  end

  def create
    @profile = Profile.new(profile_params)
    tag_list = params[:profile][:tag_name].split(nil)
    if @profile.save
      @profile.save_tag(tag_list)
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @profile_tags = @profile.tags
    @sendUser = RoomUser.where(profile_id: current_user.id)
    @receiveUser = RoomUser.where(profile_id: @profile.id)

    unless @profile.user_id == current_user.id
      @sendUser.each do |su|
        @receiveUser.each do |ru|
          if su.room_id == ru.room_id
            @isRoom = true
            @roomId = su.room_id
          end
        end
      end
      unless @isRoom
        @room = Room.new
        @roomUser = RoomUser.new
      end
    end
  end

  def edit
    @tag_list = @profile.tags.pluck(:tag_name).join(', ')
  end

  def update
    tag_list = params[:profile][:tag_name].split(' ')
    @profile.update(profile_params)
    if @profile.save
      @profile.save_tag(tag_list)
      redirect_to profile_path(@profile.id)
    else
      render :edit
    end
  end

  def destroy
    @profile.destroy
    redirect_to root_path
  end

  def search
    @tag = Tag.find(params[:tag_id])
    @profiles = @tag.profiles.all
  end

  private
  def profile_params
    params.require(:profile).permit(:image, :nickname, :comment, :content, :twitter, :instagram ).merge(user_id: current_user.id)
  end

  def set_profile
    @profile = Profile.find(params[:id])
  end
end
