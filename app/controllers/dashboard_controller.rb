class DashboardController < ApplicationController
  load_and_authorize_resource class: false

  def welcome
    redirect_to dashboard_path
  end

  def show
  end
end
