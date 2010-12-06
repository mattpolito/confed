class SpeakersController < ApplicationController
  def index
    @speakers = Speaker.order(:updated_at).limit(10)
  end

  def show
    @speaker = Speaker.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.atom do
        @presentations = Presentation.all
        render 'shared/feed', :locals => {
          :feed_title => "#{@speaker.name}'s Presentations - Confed",
          :feed_updated_at => @speaker.presentations.first.created_at,
          :presentations => @speaker.presentations
        }
      end
    end
  end
end
