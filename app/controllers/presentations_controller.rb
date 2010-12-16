class PresentationsController < ApplicationController
  def index
    respond_to do |format|
      format.html do
        @presentations = Presentation.paginate(
          :page => params[:page], :per_page => (params[:per_page] || 10)
        )
      end
      format.rss do
        redirect_to(
          presentations_url(:format => :atom), :status => :moved_permanently
        )
      end
      format.atom do
        @presentations = Presentation.all
        render 'shared/feed', :locals => {
          :feed_title => 'Most Recently Added Presentations - Confed',
          :feed_updated_at => @presentations.first.created_at,
          :presentations => @presentations
        }
      end
    end
  end

  def show
    @presentation = Presentation.find(params[:id], :scope => params[:event_id])
  end
end
