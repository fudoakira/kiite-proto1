class FavoritesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_profile

  def create
    unless @profile.user_id == current_user.id
      @favorite = Favorite.create(user_id: current_user.id, profile_id: @profile.id)
    end
  end

  def destroy
    @favorite = Favorite.find_by(user_id: current_user.id, profile_id: @profile.id)
    @favorite.destroy
  end

  private

  def set_profile
    @profile = Profile.find(params[:profile_id])
  end
end
