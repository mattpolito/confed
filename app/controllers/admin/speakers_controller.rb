class Admin::SpeakersController < AdminController
  def index
    @speakers = Speaker.all

    respond_to do |format|
      format.html
      format.xml  { render :xml => @speakers }
    end
  end

  def show
    @speaker = Speaker.find(params[:id])

    respond_to do |format|
      format.html
      format.xml  { render :xml => @speaker }
    end
  end

  def new
    @speaker = Speaker.new

    respond_to do |format|
      format.html
      format.xml  { render :xml => @speaker }
    end
  end

  def edit
    @speaker = Speaker.find(params[:id])
  end

  def create
    @speaker = Speaker.new(params[:speaker])

    respond_to do |format|
      if @speaker.save
        format.html { redirect_to(admin_speaker_path(@speaker), :notice => 'Speaker was successfully created.') }
        format.xml  { render :xml => @speaker, :status => :created, :location => @speaker }
        format.js   { render :json => @speaker }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @speaker.errors, :status => :unprocessable_entity }
        format.js   { render :partial => "admin/speakers/form", :locals => { :speaker => @speaker }, :status => "409" }
      end
    end
  end

  def update
    @speaker = Speaker.find(params[:id])

    respond_to do |format|
      if @speaker.update_attributes(params[:speaker])
        format.html { redirect_to(admin_speaker_path(@speaker), :notice => 'Speaker was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @speaker.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @speaker = Speaker.find(params[:id])
    @speaker.destroy

    respond_to do |format|
      format.html { redirect_to(admin_speakers_url) }
      format.xml  { head :ok }
    end
  end
end
