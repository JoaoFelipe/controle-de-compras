class Group < ActiveRecord::Base
  attr_accessible :date, :dollar, :name, :url

  has_many :games

  def to_label
    "#{self.name}"
  end
end
