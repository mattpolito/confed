class SpeakersController < ApplicationController
  def show
    @speaker = Speaker.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @speaker }
    end
  end
end
