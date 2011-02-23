class SpeakersController < ApplicationController
  def index
    @speakers = Speaker.paginate(
      :page => params[:page], :per_page => (params[:per_page] || 10),
      :order => 'updated_at'
    )
  end

  def show
    @speaker = Speaker.find(params[:id])
    @speaker_presentations = @speaker.presentations.released.
      order(:took_place_on.desc)

    respond_to do |format|
      format.html # show.html.erb
      format.rss do
        redirect_to(
          speakers_url(:format => :atom), :status => :moved_permanently
        )
      end
      format.atom do
        render 'shared/feed', :locals => {
          :feed_title => "#{@speaker.name}'s Presentations - Confed",
          :feed_updated_at => @speaker_presentations.first.try(:created_at),
          :presentations => @speaker_presentations
        }
      end
    end
  end
end
