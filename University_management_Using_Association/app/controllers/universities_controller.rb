class UniversitiesController < ApplicationController
    def index
        @universities = University.all
        render json: @universities      
    end
    def show
        @university = University.find(params[:id])
        render json: @university
    end
    def create
        @university = University.new(university_params)
        if @university.save
            render json: @university, status: :created
        else
            render json: @university.errors, status: :unprocessable_entity
        end
    end
    def update
        @university = University.find(params[:id])
        if @university.update(university_params)
            render json: @university
        else
            render json: @university.errors, status: :unprocessable_entity
        end
    end
    def destroy
        @university = University.find(params[:id])
        @university.destroy
        head :no_content
    end
    private
    def university_params
        params.require(:university).permit(:name, :location)
    end
end
