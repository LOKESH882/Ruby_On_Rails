class EnrollmentsController < ApplicationController
    def index
        @enrollments = Enrollment.all
        render json: @enrollments, include: [:student, :course]
    end
end
