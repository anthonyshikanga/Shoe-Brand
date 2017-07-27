class Store < ActiveRecord::Base
  has_many(:shoes)
  validates(:name, :presence => true)
  before_save(:downcase_name)

  private

    define_method(:downcase_name) do
      self.name=(name().downcase())
    end
end

#Store class inherits from ActiveRecord and added relationship
