class Type < ActiveRecord::Base
  has_many :devices
  belongs_to :user

  def self.exists?(name)
    User.find_by(name: name)
  end
end
