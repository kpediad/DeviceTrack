class Type < ActiveRecord::Base
  has_many :devices
  belongs_to :user

  def self.exists?(name)
    Type.find_by(name: name)
  end

  def self.find_or_create(args)
    type = Type.find_by(args)
    if !type then
      type = Type.create(args)
    end
    return type
  end
end
