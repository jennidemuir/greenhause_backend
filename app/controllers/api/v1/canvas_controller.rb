class Api::V1::CanvasController < ApplicationController
        def index
             canvas = Canva.select {|s| s.user_id == current_user.id}
            render json: canvas, only: [:id, :data_url, :user_id, :canvas_notes]
     
         end
        def show
            canvas = Canva.find_by(id: params[:id])
            if canvas
                render json: canvas.slice(:id, :data_url, :user_id, :canvas_notes)
            else 
                render json: {message: "Artwork Not Found!"}
            end
        end

        def new
            canvas =Canva.now
         end

        def create
             canvas = Canva.create(Canvas_params)
             render json: {message: "success"}
         end
         
         def destroy
             canvas = Canva.find_by(id: params[:id])
             canvas.destroy()
             render json: {message: "Artwork Has Been Deleted!"}
         end

    private
     def Canvas_params
         params.require(:canvas).permit(:data_url, :user_id, :canvas_notes)
     end

end

# class canvassController < ApplicationController
#     def index
       
#         sketchbooks = Sketchbook.select {|s| s.user_id == current_user.id}
#         render json: sketchbooks, only: [:id, :data_url, :user_id, :gallery_id]
     
#     end
#     def show
#         sketchbook = Sketchbook.find_by(id: params[:id])
#         if sketchbook
#             render json: sketchbook.slice(:id, :data_url, :user_id, :gallery_id)
#         else 
#             render json: {message: "Artwork Not Found!"}
#         end
#     end
#     def new
#         sketchbook = Sketchbook.new
#     end
#     def create
#         sketchbook = Sketchbook.create(sketchbook_params)
#         render json: {message: "success"}
#     end
#     def destroy
#         sketchbook = Sketchbook.find_by(id: params[:id])
#         sketchbook.destroy()
#         render json: {message: "Artwork Has Been Deleted!"}
#     end
#     private
#     def sketchbook_params
#         params.require(:sketchbook).permit(:data_url, :user_id, :gallery_id)
#     end
# end
