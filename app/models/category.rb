class Category < ActiveRecord::Base
	has_many :origins
	has_many :shelves
end
