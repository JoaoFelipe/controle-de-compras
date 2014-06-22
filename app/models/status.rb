class Status < ActiveRecord::Base
  belongs_to :game
  belongs_to :user
  attr_accessible :game_name, :status

  STATUSES = ["Jogado", "Zerado", "100%", "OK"]

  validates :status, :presence => true, :inclusion => {:in => STATUSES}
  validates :user, :presence => true
  validates :game, :presence => true
  validates :game_name, :uniqueness => { :scope => :user_id }

  before_validation :update_game_name!

  def update_game_name!
  	self.game_name = self.game.name


  end
  

end
