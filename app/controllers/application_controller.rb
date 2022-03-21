class ApplicationController < ActionController::API
    include JsonWebToken

    before_action :authenticate_request

    private

    def authenticate_request
        header = request.headers["Authorization"]
        header = header.split(" ").last if header
        
        begin
            decoded = jwt_decode(header)    
        rescue
            render json: {error: "You are not logged in"}, status: :forbidden
        return
            @current_user = User.find(decoded[:user_id])
        end
        
    end
end
