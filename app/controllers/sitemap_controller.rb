class SitemapController < ApplicationController
  def show
    respond_to do |format|
      format.xml do 
        @presentations = Presentation.released
        @speakers = Speaker.all
        @events = Event.all
        @tags = ActsAsTaggableOn::Tag.all
      end
    end
  end
end
