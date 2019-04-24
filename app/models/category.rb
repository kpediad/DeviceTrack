class Category < ActiveRecord::Base
  has_many :components
end
