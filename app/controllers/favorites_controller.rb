class FavoritesController < ApplicationController
  before_action :set_pet
  before_action :authenticate_user!

  def create
    if @pet.user_id != current_user.id
      @favorite = Favorite.create(user_id: current_user.id, pet_id: @pet.id)
    end
  end

  def destroy
    @favorite = Favorite.find_by(user_id: current_user.id, pet_id: @pet.id)
    @favorite.destroy
  end

  private
  def set_pet
    @pet = Pet.find(params[:pet_id])
  end
end
