# encoding: utf-8

class RolesController < ApplicationController
  authorize_resource

  active_scaffold :role do |config|
    config.list.columns = [:id, :name, :description]
    config.columns = [:name, :description]
    config.columns[:description].form_ui = :textarea
    config.show.link = false
  end

end