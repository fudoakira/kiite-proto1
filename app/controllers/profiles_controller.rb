class ProfilesController < ApplicationController
  before_action :set_profile, only: [:show, :edit, :update, :destroy]
  def index
    @profiles = Profile.all
  end

  def new
    @profile = Profile.new
  end

  def create
    @profile = Profile.new(profile_params)
    if @profile.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    @profile.update(profile_params)
    if @profile.save
      redirect_to profile_path(@profile.id)
    else
      render :edit
    end
  end

  def destroy
    @profile.destroy
    redirect_to root_path
  end

  private
  def item_params
    params.require(:profile).permit(:image, :nickname, :comment, :content, :twitter, :instagram ).merge(user_id: current_user.id)
  end

  def set_profile
    @profile = Profile.find(params[:id])
  end
end
