class InformationsController < ApplicationController
  skip_authorization_check
  
  def stats
    @count = Game.select(:name).where(Game.arel_table[:count].gt(0)).map(&:name).uniq.count
    @statuses = {}
    statuses_temp = {}

    Status.group(:user_id, :status).count.each_pair do |k, v|
      statuses_temp[k[0]] = {'Total' => 0} unless statuses_temp.include? k[0]
      statuses_temp[k[0]][k[1]] = v
      statuses_temp[k[0]]['Total'] += v
    end

    statuses_temp.each_pair do |k, v|
      @statuses[Status.find(k)] = v
    end

    @uss_total = 0.0
    @uss_total_original = 0.0
    @brl_total = 0.0
    @brl_total_original = 0.0
    @count_total = 0
    @uss_savings_total = 0.0
    @brl_savings_total = 0.0
    @accounts = {}
  
    Game.joins(:account).order('accounts.system desc').each do |game|
      account = game.account
      if account.nil?
        account = Account.new :login => '<Outras>', :system => '<Outro>'
      end
      login = "#{account.login} #{account.system}"
      @accounts[login] = {
        :system => account.system,
        :login => account.login,
        :uss_price => 0.0,
        :uss_original => 0.0,
        :brl_price => 0.0,
        :brl_original => 0.0,
        :count => 0,
        :uss_savings => 0.0,
        :brl_savings => 0.0,
      } if @accounts[login].nil?
      @accounts[login][:uss_price] += game.uss_price
      @accounts[login][:uss_original] += game.uss_original
      @accounts[login][:brl_price] += game.brl_price
      @accounts[login][:brl_original] += game.brl_original
      @accounts[login][:count] += game.count
      @accounts[login][:uss_savings] += game.uss_original - game.uss_price
      @accounts[login][:brl_savings] += game.brl_original - game.brl_price
      @uss_total += game.uss_price
      @uss_total_original += game.uss_original
      @brl_total += game.brl_price
      @brl_total_original += game.brl_original
      @count_total += game.count
      @uss_savings_total += game.uss_original - game.uss_price
      @brl_savings_total += game.brl_original - game.brl_price
    end
  end

  def by_account
    @accounts = {}
  
    Game.joins(:account).order('accounts.system desc, accounts.login asc, games.name asc').each do |game|
      account = game.account
      if account.nil?
        account = Account.new :login => '<Outras>', :system => '<Outro>'
      end
      login = "#{account.login} #{account.system}"
      @accounts[login] = {
        :system => account.system,
        :login => account.login,
        :games => [],
      } if @accounts[login].nil?
      if game.count > 0
        @accounts[login][:games] << game.name
      end
    end
  end

end
