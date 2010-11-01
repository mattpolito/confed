class AdminController < ApplicationController
  layout 'admin'
  before_filter :authenticate_admin!

  def index

  end

  private
    def authenticate_admin!
      unless current_user && current_user.has_role?(:admin)
        redirect_to root_path, :error => "You do not have rights to access this section"
      end
    end
end
