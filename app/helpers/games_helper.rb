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

  def count_column(record, input_name)
    unless record.children.empty?
      c = record.count + record.children.size
      "<span class='derivedcount'>#{c}</span>".html_safe
    else
      record.count
    end
  end

  def pack_column(record, input_name)
    checked = ""
    checked = "checked" if !record.parent.nil? or !record.children.empty?
    "<input disabled type='checkbox' #{checked}>".html_safe
  end
end