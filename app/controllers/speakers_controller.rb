class SpeakersController < ApplicationController
  def index
    @speakers = Speaker.order(:updated_at).limit(10)
  end

  def show
    @speaker = Speaker.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @speaker }
    end
  end
end
