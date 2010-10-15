class Admin::PresentationsController < AdminController
  before_filter :find_events, :except => [:index, :show]
  before_filter :find_speakers, :except => [:index, :show]

  def index
    @presentations = Presentation.paginate :page => params[:page], :per_page => (params[:per_page] || 20)
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
    @presentation.event_id = cookies[:last_event_id]
    
    respond_to do |format|
      format.html
      format.js do
        render 'form', :speaker => Speaker.new
      end
    end
  end

  def edit
    @presentation = Presentation.find(params[:id])
    @presentation.videos.build unless @presentation.videos.present?
    @presentation.slideshows.build unless @presentation.slideshows.present?
  end

  def create
    @presentation = Presentation.new(params[:presentation])
    if @presentation.save
      cookies[:last_event_id] = @presentation.event_id
      flash[:success] = "Presentation created!"
      redirect_to admin_presentations_path
    else
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
    def find_events
      @events = Event.all :order => 'name'
    end

    def find_speakers
      @speakers = Speaker.all :order => 'name'
    end
end

