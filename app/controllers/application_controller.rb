class ApplicationController < ActionController::API
    before_action :authorized
   
    def encode_token(payload)
     
      # should store secret in env variable
      JWT.encode(payload, 'my_s3cr3t')
    end

    def issue_token(user)

    
        JWT.encode({user_id: user.id}, 'my_s3cr3t', 'HS256')
      end
  
    def auth_header
      # { Authorization: 'Bearer <token>' }
      request.headers['Authorization']
    end

    def token

   
        request.headers['Authorization']
      end
  
    def decoded_token
      if auth_header
        
        # header: { 'Authorization': 'Bearer <token>' }
        begin
          JWT.decode(auth_header, 'my_s3cr3t', true, { :algorithm => 'HS256' })
        rescue JWT::DecodeError
          nil
        end
      end
    end

    def user_id
        decoded_token.first["user_id"]
      end
  
    def current_user
      if decoded_token
        user_id = decoded_token[0]['user_id']
        @user = User.find_by(id: user_id)
      end
    end
  
    def logged_in?
     !!current_user
    end
  
    def authorized
    #  byebug
        render json: { message: 'Please log in' }, status: :unauthorized unless logged_in?
    end
end
