class RatingsController < ApplicationController

  before_action :authenticate_user!
  before_action :set_profile, only: [:edit, :update]
  before_action :set_rating, only: [:edit, :update]

  def new
    @rating = Rating.new
  end

  def create
    @rating.create(rating_params)
    if @rating.save
      redirect_to profile_path(@profile.id)
    else
      render :new
    end
  end

  def edit
  
  end

  def update
    @rating.update(rating_params)
    if @rating.save
      redirect_to profile_path(@profile.id)
    else
      render :edit
    end
  end

  private

  def set_rating
    @rating = Rating.find(params[:id])
  end

  def set_profile
    @profile = Profile.find(params[:profile_id])
  end

  def rating_params
    params.require(:rating).permit(:rate).merge(user_id: current_user.id, profile_id: @profile.id)
  end
end
