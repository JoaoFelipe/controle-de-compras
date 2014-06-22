class EmailsController < ApplicationController
  authorize_resource
  active_scaffold :"email" do |conf|
  end
end
