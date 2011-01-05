class EventsController < ApplicationController
  def index
    @events = Event.paginate(
      :page => params[:page], :per_page => (params[:per_page] || 10)
    )
  end

  def show
    @event = Event.find(params[:id]) 

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
          :feed_updated_at => @event.presentations.first.created_at,
          :presentations => @event.presentations
        }
      end
    end
  end
end
