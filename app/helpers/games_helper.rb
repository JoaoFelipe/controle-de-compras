module GamesHelper
  def uss_price_column(record, input_name)
    '%.2f' % record.uss_price
  end

  def brl_price_column(record, input_name)
    '%.2f' % record.brl_price
  end

  def uss_original_column(record, input_name)
    '%.2f' % record.uss_original
  end

  def brl_original_column(record, input_name)
    '%.2f' % record.brl_original
  end

end