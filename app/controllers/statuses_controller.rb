class StatusesController < ApplicationController
  authorize_resource
  active_scaffold :"status" do |config|
  	config.columns[:game].form_ui = :record_select
    config.columns[:user].form_ui = :record_select
    config.columns[:status].form_ui = :select
    config.columns[:status].options = {:options => Status::STATUSES}
  	columns = [
      :game,
      :user,
      :status, 
    ]
   
    config.create.columns = columns
    config.update.columns = columns

    config.list.columns = [
      :game_name,
      :user,
      :status,
    ]
  end
end
