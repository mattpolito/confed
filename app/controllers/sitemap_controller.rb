class SitemapController < ApplicationController
  def show
    respond_to do |format|
      format.xml do 
        @speakers = Speaker.all
        @events = Event.order("updated_at DESC")
        @tags = ActsAsTaggableOn::Tag.all
      end
    end
  end
end
