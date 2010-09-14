class PresentationsController < ApplicationController
  def index
    @presentations = Presentation.order('created_at DESC').limit(10)
  end

  def show
    @presentation = Presentation.find(params[:id])
  end

  def search
    @search_value = params[:q]
    redirect_to :root and return if @search_value.blank?

    @presentations = Presentation.search(@search_value)
  end

end
