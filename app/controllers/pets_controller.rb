class PetsController < ApplicationController
  def index
    @pets = Pet.all
  end

  def show
  end

  def new
    @pet = Pet.new
  end

  def create
    @pet = Pet.new(pet_params)
    @pet.user_id = current_user
    @pet.save!
    redirect_to pets_url @pet
  end

  def edit
  end

  def update
  end

  def destroy
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
            :pic_id,
            :video_id
            )
    end
end
