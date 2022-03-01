class NotesController < ApplicationController
    def index
        @notes = @current_user.notes.all
        render json: @notes
    end
    def show
        @note = Note.find(params[:id])
        render json: @note
    end
    def create
        # @note = Note.create(
        #     title: params[:title],
        #     body: params[:body],
        #     user_id: params[:user_id]
        # )
        # render json: @note

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
    def update
        @note = Note.find(params[:id])
        @note.update(
            title: params[:title],
            body: params[:body]
        )
        render json: @note
    end
    def destroy
        @notes = Note.all
        @note = Note.find(params[:id])
        @note.destroy
        render json: @note
    end
end
