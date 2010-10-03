class Admin::SpeakerRateController < AdminController
  def speakers
    @speaker = SpeakerRate.get_speaker(params[:id])
    respond_to do |format|
      format.js{
        render :json => @speaker.to_json
      }
    end
  end
end
