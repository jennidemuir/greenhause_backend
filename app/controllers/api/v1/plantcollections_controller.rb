class Api::V1::PlantcollectionsController < ApplicationController
    
    def index
        plantcollection = plantcollection.select {|s| s.user_id == current_user.id}
       render json: plantcollection, only: [:id, :user_id, :plantcard_id]

    end
   def show
       plantcollection = Plantcollection.find_by(id: params[:id])
       if plantcollection
           render json: plantcollection.slice(:id, :user_id, :plantcard_id)
       else 
           render json: {message: "Plant Collection Not Found!"}
       end
   end

   def new
       plantcollection = Plantcollection.now
    end

   def create
        plantcollection = Plantcollection.create(plantcollection_params)
        render json: {message: "success"}
    end
    
    def destroy
        plantcollection = Plantcollection.find_by(id: params[:id])
        plantcollection.destroy()
        render json: {message: "Plant Collection Has Been Deleted!"}
    end

private
def plantcollection_params
    params.require(:plantcollection).permit(:user_id, :plantcard_id)
end

end
