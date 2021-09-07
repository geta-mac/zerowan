class PetsController < ApplicationController
  def index
    @pets = Pet.where(user_id: current_user.id)
  end

  def show
    @pet = Pet.find(params[:id])
  end

  def new
    @pet = Pet.new
  end

  def create
    @pet = Pet.new(pet_params)
    @pet.user_id = current_user.id
    @pet.save!
    redirect_to pets_url @pet
  end

  def edit
    @pet = Pet.find(params[:id])
  end

  def update
    @pet = Pet.find(params[:id])
    @pet.update(pet_params)
    redirect_to pet_url @pet
  end

  def destroy
    @pet = Pet.find(params[:id])
    @pet.destroy
    redirect_to pets_url
  end

  private
    def pet_params
          params.require(:pet).permit(
            :name,
            :age,
            :castration,
            :category,
            :character,
            :avairable_area,
            :animal_type,
            :description,
            :image1,
            :image2,
            :image3,
            :image4,
            :video,
            :gender
            )
    end
end
