class Admin::PresentationsController < AdminController
  def index
    @presentations = Presentation.all

    respond_to do |format|
      format.html
      format.xml  { render :xml => @speakers }
    end
  end

  def new
    @presentation = Presentation.new    
    @speakers     = Speaker.all
  end

  def create
    @presentation = Presentation.new(params[:presentation])

    if @presentation.save
      flash[:success] = "Presentation created!"
      redirect_to admin_presentations_path
    else
      render :new
    end
  end
end
