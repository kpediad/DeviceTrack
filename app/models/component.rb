class Component < ActiveRecord::Base
  belongs_to :device
  belongs_to :category
end
