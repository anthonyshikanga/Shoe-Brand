class Store < ActiveRecord::Base
  has_many(:shoes)
  validates(:name, :presence => true)
end

#Store class inherits from ActiveRecord and added relationship
