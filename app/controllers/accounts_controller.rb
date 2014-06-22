class AccountsController < ApplicationController
  authorize_resource
  active_scaffold :"account" do |config|
  	columns = [
  	  :system,
      :login,
      :password,
      :email, 
      :facebook,
    ]
   
    config.create.columns = columns
    config.update.columns = columns

    config.list.columns = [
  	  :system,
      :login,
      :password,
      :email, 
      :facebook,
      :games
    ]
  end
  record_select :per_page => 10, :search_on => [:login, :system], :order_by => 'login', :full_text_search => true

end
