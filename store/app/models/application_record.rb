class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class
end

class Product < ApplicationRecord
end
