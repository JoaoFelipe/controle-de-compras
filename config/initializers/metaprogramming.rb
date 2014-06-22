

Version.class_eval do
  def to_label
    I18n.t("activerecord.attributes.version.label", 
    	event: I18n.t("activerecord.attributes.version.event_options.#{event}"), 
    	type: I18n.t("activerecord.models.#{item_type.underscore}.one"))
  end
end

