class ContactUsController < ApplicationController
  skip_before_filter :authenticate_user!

  def index
    redirect_to dashboard_index_path if current_user
  end
end
