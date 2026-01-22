class Employee < ApplicationRecord
    validates :name, :age, presence: true
    
end
