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

  def edit
    @presentation = Presentation.find(params[:id])
    @speakers = Speaker.all
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

  def update
    @presentation = Presentation.find(params[:id])

    respond_to do |format|
      if @presentation.update_attributes(params[:presentation])
        format.html { redirect_to(admin_presentation_path(@presentation), :notice => 'Presentation was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @presentation.errors, :status => :unprocessable_entity }
      end
    end
  end
end
