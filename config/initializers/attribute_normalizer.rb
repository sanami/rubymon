AttributeNormalizer.configure do |config|
  [:downcase, :upcase, :titleize].each do |method_name|
    config.normalizers[method_name] = ->(value, options) {
      value.is_a?(String) ? value.send(method_name) : value
    }
  end

  config.normalizers[:html_sanitizer] = ->(value, options) do
    if value.is_a?(String)
      sanitizer = Rails::Html::WhiteListSanitizer.new
      sanitizer.sanitize(value)
    else
      value
    end
  end

  # The default normalizers if no :with option or block is given is to apply the :strip and :blank normalizers (in that order).
  # You can change this if you would like as follows:
  # config.default_normalizers = [:squish, :blank]

  # You can enable the attribute normalizers automatically if the specified attributes exist in your column_names. It will use
  # the default normalizers for each attribute (e.g. config.default_normalizers)
  # config.default_attributes = :name, :title

  # Also, You can add a specific attribute to default_attributes using one or more normalizers:
  # config.add_default_attribute :name, :with => :truncate
end
