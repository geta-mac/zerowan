class TopController < ApplicationController
  before_action :set_q, only: [:index, :search]

  def index
    @pets = Pet.all
  end

  def show
    @pet = Pet.find(params[:id])
  end

  def search
    @results = @q.result
    @pets = Pet.where(category:params[:q][:category])
      .where(animal_type:params[:q][:animal_type])
      .where(gender:params[:q][:gender])
      .where(avairable_area:params[:q][:avairable_area])
      .where(age:params[:q][:age])

    respond_to do |format|
      format.html { render :index }
      format.js
    end
  end

  private

  def set_q
    @q = Pet.ransack(params[:q])
  end
end
