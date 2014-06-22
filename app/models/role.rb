class Role < ActiveRecord::Base

  has_many :users, :dependent => :restrict

  ROLE_UNKNOWN = 1
  ROLE_VIEWER = 2
  ROLE_ADMIN = 3

  ORDER = [
  	ROLE_UNKNOWN,
  	ROLE_VIEWER,
  	ROLE_ADMIN
  ]

  has_paper_trail
end
