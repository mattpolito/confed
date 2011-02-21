class SavedPresentationsController < ApplicationController
  def create
    presentation = Event.find(params[:event_id]).presentations.find(params[:presentation_id])
    current_user.saved_presentations.create(:presentation => presentation)

    respond_to do |format|
      format.html do 
        flash[:success] = "Presentation Saved"
        redirect_to :back
      end
    end
  end
end
