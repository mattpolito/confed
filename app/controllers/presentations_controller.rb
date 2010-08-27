class PresentationsController < ApplicationController
  def index
    @presentations = Presentation.order('created_at DESC').limit(10)
  end

  def show
    @presentation = Presentation.find(params[:id])
  end

end
