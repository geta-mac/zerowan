class TopController < ApplicationController
    def index
        @pets = Pet.all
    end

    def show
        @pets = Pet.all
        @pet = Pet.find(params[:id])
    end

end
