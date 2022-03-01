class NotesController < ApplicationController
    before_action :set_note, only: [:show, :update, :destroy]

    # show user's notes
    def index
        @notes = @current_user.notes.all
        render json: @notes
    end
    # /notes/{:id}
    def show
        render json: @note
    end
    # create a note
    def create
        @note = @current_user.notes.new(
            title: params[:title],
            body: params[:body]
        )
        if @note.save
            render json: @note, status: :created, location: @note
        else
            render json: @note.errors, status: :unprocessable_entity
        end

    end
    # update a note
    def update
        if @note.update(
            title: params[:title],
            body: params[:body]
        )
        render json: @note
        else
            render json: @note.errors, status: :unprocessable_entity
        end
    end
    # delete a note
    def destroy
        @note.destroy
    end

    private

    def set_note
        @note = @current_user.notes.find(params[:id])
      end
end
