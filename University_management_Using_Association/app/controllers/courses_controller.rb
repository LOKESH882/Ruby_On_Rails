class CoursesController < ApplicationController
    def index
        @university = University.find(params[:university_id])
        @department = @university.departments.find(params[:department_id])
        @courses = @department.courses
        render json: @courses, include: [:students]
    end

    def show
        @university = University.find(params[:university_id])
        @department = @university.departments.find(params[:department_id])
        @course = @department.courses.find(params[:id])
        render json: @course, include: [:students]
    end
    def create
        @university = University.find(params[:university_id])
        @department = @university.departments.find(params[:department_id])
        @course = @department.courses.new(course_params)
        if @course.save
            render json: @course, status: :created
        else
            render json: @course.errors, status: :unprocessable_entity
        end
    end
    private
    def course_params
        params.require(:course).permit(:name)
    end
end
