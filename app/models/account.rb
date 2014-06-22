class Account < ActiveRecord::Base
  attr_accessible :email_id, :facebook, :login, :password, :system

  belongs_to :email, :class_name => 'Email', :foreign_key => 'email_id'
  belongs_to :facebook, :class_name => 'Email', :foreign_key => 'facebook_id'
  
  has_many :games

  def to_label
    "#{self.system} - #{self.login}"
  end
end
