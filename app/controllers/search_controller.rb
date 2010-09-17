class SearchController < ApplicationController

  def search
    @search_value = params[:q]
    redirect_to :root and return if @search_value.blank?

    @presentations = Presentation.search(@search_value)
    @speakers = Speaker.search(@search_value)
  end

end
