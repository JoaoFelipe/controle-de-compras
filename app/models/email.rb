class Email < ActiveRecord::Base
  attr_accessible :address, :password

  def to_label
    "#{self.address} --- #{self.password}"
  end
end
