class SearchController < ApplicationController

  def search
    @search_value = params[:q]
    redirect_to :root and return if @search_value.blank?

    search = "#{@search_value}*"
    @presentations = Presentation.search(search)
    @speakers = Speaker.search(search)
  end

end
