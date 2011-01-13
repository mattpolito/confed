class EventsController < ApplicationController
  def index
    @events = Event.paginate(
      :page => params[:page], :per_page => (params[:per_page] || 10)
    )
  end

  def show
    @event = Event.includes(:presentations).find(params[:id])
    @presentations = @event.presentations.released

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
          :feed_updated_at => @event.presentations.released.first.try(:created_at),
          :presentations => @event.presentations.released
        }
      end
    end
  end
end
