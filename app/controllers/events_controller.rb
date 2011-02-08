class EventsController < ApplicationController
  def index
    @events = Event.paginate(
      :page => params[:page], :per_page => (params[:per_page] || 10)
    )
  end

  def show
    @event = Event.includes(:presentations).find(params[:id])
    @presentations = @event.presentations.released.order("took_place_on DESC")

    respond_to do |format|
      format.html
      format.rss do
        redirect_to(
          event_url(@event, :format => :atom), :status => :moved_permanently
        )
      end
      format.atom do
        render 'shared/feed', :locals => {
          :feed_title => "#{@event.name}'s Presentations - Confed",
          :feed_updated_at => @presentations.first.try(:created_at),
          :presentations => @presentations
        }
      end
    end
  end
end
