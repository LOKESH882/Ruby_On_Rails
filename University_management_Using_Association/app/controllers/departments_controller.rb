class DepartmentsController < ApplicationController
    def index
        @university = University.find(params[:university_id])
        @departments = @university.departments
        render json: @departments, include: :courses
    end

    def show
        @university = University.find(params[:university_id])
        @department = @university.departments.find(params[:id])
        render json: @department, include: :courses
    end

    def create
        @university = University.find(params[:university_id])
        @department = @university.departments.new(department_params)
        if @department.save
            render json: @department, status: :created
        else
            render json: @department.errors, status: :unprocessable_entity
        end
    end

    def update
        @university = University.find(params[:university_id])
        @department = @university.departments.find(params[:id])
        if @department.update(department_params)
            render json: @department
        else
            render json: @department.errors, status: :unprocessable_entity
        end
    end
    def destroy
        @university = University.find(params[:university_id])
        @department = @university.departments.find(params[:id])
        @department.destroy
        head :no_content
    end
    private
    def department_params
        params.require(:department).permit(:name)
    end
end
