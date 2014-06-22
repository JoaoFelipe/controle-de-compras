class AccountsController < ApplicationController
  authorize_resource
  active_scaffold :"account" do |conf|
  end
  record_select :per_page => 10, :search_on => [:login], :order_by => 'login', :full_text_search => true

end
