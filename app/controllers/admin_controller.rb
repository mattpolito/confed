class AdminController < ApplicationController
  layout 'admin'
  before_filter :authenticate_admin!

  def index

  end

  private
    def authenticate_admin!
      if current_user.blank?
        authenticate_user!
      elsif current_user && !current_user.has_role?(:admin)
        flash[:error] = "You do not have rights to access this section"
        redirect_to root_path
      end
    end
end
