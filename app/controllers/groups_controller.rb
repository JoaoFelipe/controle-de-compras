class GroupsController < ApplicationController
  authorize_resource
  active_scaffold :"group" do |conf|
  end
  record_select :per_page => 10, :search_on => [:name], :order_by => 'name', :full_text_search => true

end
