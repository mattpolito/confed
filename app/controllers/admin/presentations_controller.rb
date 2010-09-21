class Admin::PresentationsController < AdminController
  def index
    @presentations = Presentation.all
    respond_to do |format|
      format.html
      format.xml  { render :xml => @speakers }
    end
  end

  def show
    @presentation = Presentation.find(params[:id])

    respond_to do |format|
      format.html
      format.xml  { render :xml => @presentation }
    end
  end

  def new
    @presentation = Presentation.new    
    @presentation.videos.build
    @presentation.slideshows.build
    find_speakers
  end

  def edit
    @presentation = Presentation.find(params[:id])
    @speakers     = Speaker.all :order => 'name'
  end

  def create
    @presentation = Presentation.new(params[:presentation])

    if @presentation.save
      flash[:success] = "Presentation created!"
      redirect_to admin_presentations_path
    else
      find_speakers
      render :new
    end
  end

  def update
    @presentation = Presentation.find(params[:id])
    external_embed = params[:presentation].delete(:external_embed)

    if @presentation.update_attributes(params[:presentation])
      redirect_to(admin_presentations_path, :notice => 'Presentation updated!')
    else
      render :edit
    end
  end

  private
    def find_speakers
      @speakers     = Speaker.all :order => 'name'
    end
end
