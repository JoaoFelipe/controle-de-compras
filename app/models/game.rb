class Game < ActiveRecord::Base
  belongs_to :group
  belongs_to :account
  belongs_to :parent, :class_name => 'Game', :foreign_key => 'game_id'
  has_many :children, :class_name => 'Game', :foreign_key => 'game_id'
  attr_accessible :brl_original, :brl_price, :count, :name, :uss_original, :uss_price
  attr_accessor :temp_price, :temp_original

  validates :group, :presence => true
  validates :name, :presence => true

  def uss_price
  	return self.price if not self.is_brl
  	(self.price / self.group.dollar)
  end

  def uss_original
  	return self.original_price if not self.is_brl
  	(self.original_price / self.group.dollar)
  end

  def brl_price
  	return self.price if self.is_brl
  	(self.price * self.group.dollar)
  end

  def brl_original
  	return self.original_price if self.is_brl
  	(self.original_price * self.group.dollar)
  end

  def group_name
    self.group.name
  end

  def account_name
    self.account.login unless self.account.nil?
  end

  def to_label
    "#{self.name}"
  end
end
