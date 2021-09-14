class Admins::PostsController < ApplicationController
  def index
    @pets = Pet.all
  end

  def show
  end

  def edit
  end
end
