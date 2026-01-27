class Department < ApplicationRecord
  belongs_to :university
  has_many :courses, dependent: :destroy
end
