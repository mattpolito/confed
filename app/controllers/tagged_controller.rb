class TaggedController < ApplicationController
  def show
    @presentations = Presentation.tagged_with(params[:tag_name])
  end
end
