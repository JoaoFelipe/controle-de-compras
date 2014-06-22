module GroupsHelper
  def url_column(record, input_name)
    link_to 'Link', record.url unless record.url.nil? or record.url.empty?
  end

  def date_column(record, input_name)
    I18n.localize(record.date, {:format => :monthyear}) unless record.date.nil? or record.nil?
  end

end