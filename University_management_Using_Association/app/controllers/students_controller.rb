class StudentsController < ApplicationController
    def index
        @university = University.find(params[:university_id])
        @students = @university.students
        render json: @students, include: [:courses]
    end
    def show
        @university = University.find(params[:university_id])
        @student = @university.students.find(params[:id])
        render json: @student, include: [:courses]
    end
    def create
        @university = University.find(params[:university_id])
        @student = @university.students.new(student_params)
        if @student.save
            render json: @student, status: :created
        else
            render json: @student.errors, status: :unprocessable_entity
        end
    end
    def update
        @university = University.find(params[:university_id])
        @student = @university.students.find(params[:id])
        if @student.update(student_params)
            render json: @student
        else
            render json: @student.errors, status: :unprocessable_entity
        end
    end
    def destroy
        @university = University.find(params[:university_id])
        @student = @university.students.find(params[:id])
        @student.destroy
        head :no_content
    end
    private
    def student_params
        params.require(:student).permit(:name)
    end
end
