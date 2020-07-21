class Api::V1::PlantcardsController < ApplicationController

    def index
        plantcard = Plantcard.select {|s| s.user_id == current_user.id}
       render json: plantcard, only: [:id, :commonname, :scientificname, :description]

    end
   def show
       plantcard = Plantcard.find_by(id: params[:id])
       if plantcard
           render json: plantcard.slice(:id, :commonname, :scientificname, :description)
       else 
           render json: {message: "Plant Card Not Found!"}
       end
   end

   def new
       plantcard = Plantcard.now
    end

   def create
        plantcard = Plantcard.create(plantcard_params)
        render json: {message: "success"}
    end
    
    def destroy
        plantcard = Plantcard.find_by(id: params[:id])
        plantcard.destroy()
        render json: {message: "Plant Card Has Been Deleted!"}
    end

private
def plantcard_params
    params.require(:plantcard).permit(:commonname, :scientificname, :description)
end


end
