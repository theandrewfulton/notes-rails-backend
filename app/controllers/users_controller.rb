class UsersController < ApplicationController
    skip_before_action :authenticate_request, only: [:create]

    # GET /users
    # def index
    #     @user = @current_user
    #     render json: @user, status: :ok
    # end

    # GET /users/{username}
    # def show
    #     render json: @current_user, status: :ok
    # end

    #POST /users
    def create
        @user = User.new(user_params)
        if @user.save
            token = jwt_encode(user_id: @user.id)
            render json: { token: token }, status: :created
        else
            render json: { errors: @user.errors.full_messages },
            status: :unprocessable_entity
        end
    end

    # PUT /users/{username}
    # def update
    #     unless @user.update(user_params)
    #         render json: {errors: @user.errors.full_messages },
    #         status: :unprocessable_entity
    #     end
    # end

    # DELETE /users/{username}
    def destroy
        @user.destroy
    end

    private

    def user_params
        params.permit(:username, :email, :password, :password_confirmation)
    end

end