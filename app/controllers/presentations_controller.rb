class PresentationsController < ApplicationController
  def index
  end

  def show
    @presentation = Presentation.find(params[:id])
  end

end
