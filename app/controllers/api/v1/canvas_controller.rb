class Api::V1::CanvasController < ApplicationController
    

        def index
         
            canvas = current_user.canvas
         
            #  canvas = Canva.select {|s| s.user_id == current_user.id}
            render json: canvas, only: [:id, :image, :canvas_notes]
     
         end
        def show
            canvas = Canva.find_by(id: params[:id])
            if canvas
                render json: canvas.slice(:id, :image, :user_id, :canvas_notes)
            else 
                render json: {message: "Artwork Not Found!"}
            end
        end

        def new
            canvas =Canva.now
         end

        def create
    
            canvas = Canva.new(user_id: current_user.id, image: params[:canvas][:image])
         
            if canvas.save
              blob = ActiveStorage::Blob.find_by(key: [params[:image]])
                    if blob
                        canvas.image.attach(blob)
                    end
              render json: {msg: 'Successfully Create', id: canvas.id}, status: 200
            else
              render json: {msg: 'Could not create', error: canvas.errors.messages}, status: 409
            end
         end

         def edit 
            @canvas = Canva.find(params[:id])
          end
      
          def update
            @canvas = Canva.find(params[:id])
            # byebug
            @canvas.update(canvas_params)
            render json: @canvas.to_json
          end
         
         def destroy
             canvas = Canva.find_by(id: params[:id])
             canvas.destroy()
             render json: {message: "Artwork Has Been Deleted!"}
         end

    private
     def canvas_params
         params.require(:canvas).permit(:image, :canvas_notes)
     end

end

