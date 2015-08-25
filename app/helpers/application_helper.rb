module ApplicationHelper
  def set_page_title(title = nil)
    if title.blank?
      qualified_controller_name = controller.controller_path.gsub('/', '-')
      title = I18n.translate("titles.#{qualified_controller_name}.#{action_name}", default: '')
      title = I18n.translate("titles.#{qualified_controller_name}", default: '') if title.blank?
    end

    # title = "titles.#{controller_name}.#{action_name}"
    content_for(:page_title, title) if title.present?
  end
end
