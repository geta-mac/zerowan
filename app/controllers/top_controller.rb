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
  end

  private

  def set_q
    @q = Pet.ransack(params[:q])
  end
end
