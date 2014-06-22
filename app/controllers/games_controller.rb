class GamesController < ApplicationController
  authorize_resource
  active_scaffold :"game" do |config|
    config.list.per_page = 50
    config.columns.add :uss_price, :brl_price, :uss_original, :brl_original
    
    config.columns[:account].form_ui = :record_select
    config.columns[:group].form_ui = :record_select
    config.columns[:parent].form_ui = :record_select
    style = {:style => 'width: 60px; margin-left: 2px;'}
    [:price, :original_price].each do |c|
      config.columns[c].options = style
    end

    config.columns[:uss_price].sort_by :method => 'uss_price'
    config.columns[:uss_original].sort_by :method => 'uss_original'
    config.columns[:brl_price].sort_by :method => 'brl_price'
    config.columns[:brl_original].sort_by :method => 'brl_original'
    config.columns[:group].sort_by :method => 'group_name'
    config.columns[:account].sort_by :method => 'account_name'

    columns = [
      :group,
      :name,
      :price, 
      :original_price,
      :is_brl,
      :account,
      :parent,
    ]
   
    config.create.columns = columns
    config.update.columns = columns

    config.list.columns = [
      :group,
      :name,
      :account,
      :uss_price,
      :uss_original,
      :brl_price,
      :brl_original,
      :count,

    ]
    
  end
  record_select :per_page => 10, :search_on => [:name], :order_by => 'name', :full_text_search => true

end
