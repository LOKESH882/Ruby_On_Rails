class Student < ApplicationRecord
    validates :name, :education, presence: true
    validates :email, uniqueness: true
    validates :name, length: {minimum: 2, maximum: 10}
    validates :name, format: {with: /\A[a-zA-Z]+\z/, message: 'only letters are allowed'}
    # validates :age, presence: true, numercality: true
    
    #custom validation
    # validate :validate_student_age
    def validate_student_age
        age = ((Date.today - date_of_birth) / 365 ).to_i
        if age < 15
            errors.add(:date_of_birth, 'age must be greater than 15 years')
        end
    end

    after_commit :display_student_name

    def display_student_name
        puts " You Saved a Details of #{name}"
    end

end

