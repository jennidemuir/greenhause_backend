class Api::V1::PlantcollectionsController < ApplicationController
    
    def index
        plantcollection = current_user.plantcollections
       render json: plantcollection, only: [:id, :user_id, :plantcard_id, :plantnote]

    end
   def show
       plantcollection = Plantcollection.find_by(id: params[:id])
       if plantcollection
           render json: plantcollection.slice(:id, :user_id, :plantcard_id, :plantnote)
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

    def edit 
        @plantcollection = Plantcollection.find(params[:id])
      end
  
      def update
        @plantcollection = Plantcollection.find(params[:id])
       
       @plantcollection.update(plantnote: params[:plantcollection][:plantnote])
        
        render json: @plantcollection.to_json
      end
    
    def destroy
        plantcollection = Plantcollection.find_by(id: params[:id])
        plantcollection.destroy()
        render json: {message: "Plant Collection Has Been Deleted!"}
    end

private
def plantcollection_params
    params.require(:plantcollection).permit(:user_id, :plantcard_id, :plantnote)
end

end
