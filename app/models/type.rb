class Type < ActiveRecord::Base
  has_many :devices

  def self.exists?(name)
    User.find_by(name: name)
  end
end
