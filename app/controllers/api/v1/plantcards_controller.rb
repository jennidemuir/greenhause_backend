class Api::V1::PlantcardsController < ApplicationController

    def index
        # byebug
        plantcards = current_user.plantcards
       render json: plantcards, only: [:id, :commonname, :scientificname, :img_url]

    end

   def show
       plantcard = Plantcard.find_by(id: params[:id])
       if plantcard
           render json: plantcard.slice(:id, :commonname, :scientificname, :img_url)
       else 
           render json: {message: "Plant Card Not Found!"}
       end
   end

   def new
       plantcard = Plantcard.now
    end

   def create
    # byebug
   
       plantcard = Plantcard.create(plantcard_params)
        plantcollection = Plantcollection.create({user_id: current_user.id, plantcard_id: plantcard.id})
        render json: {message: "success"}
    end
    
    def destroy
        plantcard = Plantcard.find_by(id: params[:id])
        plantcard.destroy()
        render json: {message: "Plant Card Has Been Deleted!"}
    end

private
    def plantcard_params
        params.require(:plantcard).permit(:commonname, :scientificname, :img_url)
    end


end
