class NotesController < ApplicationController
    before_action :authenticate_user!
    
    def index
        @notes = Note.all
        render json: @notes
    end
    def show
        @note = Note.find(params[:id])
        render json: @note
    end
    def create
        @note = Note.create(
            title: params[:title],
            body: params[:body]
        )
        render json: @note
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
