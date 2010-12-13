class TaggedController < ApplicationController
  def show
    @presentations = Presentation.find_all_by_tag_permalink(params[:tag_permalink])
    @tag = ActsAsTaggableOn::Tag.find_by_permalink(params[:tag_permalink])

    respond_to do |format|
      format.html
      format.atom do
        render 'shared/feed', :locals => {
          :feed_title => "Presentations tagged with #{params[:tag_name]} - Confed",
          :feed_updated_at => @presentations.first.created_at,
          :presentations => @presentations
        }
      end
    end
  end
end
