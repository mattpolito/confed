class Admin::EventsController < AdminController
  # GET /admin/events
  # GET /admin/events.xml
  def index
    @events = Event.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @events }
    end
  end

  # GET /admin/events/1
  # GET /admin/events/1.xml
  def show
    @event = Event.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @event }
    end
  end

  # GET /admin/events/new
  # GET /admin/events/new.xml
  def new
    @event = Event.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @event }
    end
  end

  # GET /admin/events/1/edit
  def edit
    @event = Event.find(params[:id])
  end

  # POST /admin/events
  # POST /admin/events.xml
  def create
    @event = Event.new(params[:event])

    respond_to do |format|
      if @event.save
        format.html { redirect_to([:admin, @event], :notice => 'Event was successfully created.') }
        format.xml  { render :xml => @event, :status => :created, :location => @event }
        format.js   { render :json => @event }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @event.errors, :status => :unprocessable_entity }
        format.js   { render :partial => 'admin/events/form', :locals => { :event => @event }, :status => "409" }
      end
    end
  end

  # PUT /admin/events/1
  # PUT /admin/events/1.xml
  def update
    @event = Event.find(params[:id])

    respond_to do |format|
      if @event.update_attributes(params[:event])
        format.html { redirect_to([:admin, @event], :notice => 'Event was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @event.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/events/1
  # DELETE /admin/events/1.xml
  def destroy
    @event = Event.find(params[:id])
    @event.destroy

    respond_to do |format|
      format.html { redirect_to(admin_events_url) }
      format.xml  { head :ok }
    end
  end
end
