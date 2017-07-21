class Shoe < ActiveRecord::Base
  has_many(:stores)
end
