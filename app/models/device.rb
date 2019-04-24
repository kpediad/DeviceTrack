class Device < ActiveRecord::Base
  has_many :components
  belongs_to :type
  belongs_to :user
end
