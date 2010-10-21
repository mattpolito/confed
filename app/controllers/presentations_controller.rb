class PresentationsController < ApplicationController
  def index
    @presentations = Presentation.order('created_at DESC').paginate(:page => params[:page], :per_page => (params[:per_page] || 20))
  end

  def show
    @presentation = Presentation.find(params[:id])
  end

end
