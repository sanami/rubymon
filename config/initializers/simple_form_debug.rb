# Log error
class SimpleForm::FormBuilder
  def error_notification(options = {})
    begin
      if object.errors.present?
        Rails.logger.debug do
          "!!! #{object.class}: #{object.errors.to_hash}"
        end
      end
    rescue
    end

    SimpleForm::ErrorNotification.new(self, options).render
  end
end
