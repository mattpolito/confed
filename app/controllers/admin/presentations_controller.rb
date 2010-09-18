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
    @speakers     = Speaker.all :order => 'name'
  end

  def edit
    @presentation = Presentation.find(params[:id])
    @speakers     = Speaker.all :order => 'name'
  end

  def create
    external_embed = params[:presentation].delete(:external_embed)
    @presentation = Presentation.new(params[:presentation])
    unless external_embed.each(&:blank?)
      @presentation.create_embedded_content(external_embed)
    end

    if @presentation.save
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
end
