class Store < ActiveRecord::Base
  has_many(:shoes)
end

#Store class inherits from ActiveRecord and added relationship
