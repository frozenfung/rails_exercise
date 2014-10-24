class EventsController < ApplicationController
  before_action :set_event, :only => [ :show, :edit, :update, :destroy]

  def index
    @events = Event.page(params[:page]).per(5)

    Rails.logger.debug("event: #{@event.inspect}")

    respond_to do |format|
      format.html # index.html.erb
      format.xml { render :xml => @events.to_xml }
      format.json { render :json => @events.to_json }
      format.atom { @feed_title = "My event list" } # index.atom.builder
    end
  end
  

  # GET
  def new
    @event = Event.new
  end
  

  # POST
  def create
    @event = Event.new(event_params)
    # @event = Event.new( :name => params[:event][:name])
    @event.save
    if @event.save
      flash[:notice] = "event was successfully updated"
      redirect_to events_url
    else
      render new_event_url
    end
  end

  # GET
  def show
    @page_title = @event.name
    respond_to do |format|
      format.html { @page_title = @event.name } # show.html.erb
      format.xml # show.xml.builder
      format.json { render :json => { id: @event.id, name: @event.name }.to_json }
    end
  end

  # GET
  def edit

  end


  # GET
  def update
    if @event.update_attributes(event_params)
      redirect_to event_url(@event)
    else
      render new_event_url
    
    end
  end

  #
  def destroy
    @event.destroy
    flash[:alert] = "event was successfully deleted"
    redirect_to events_url
  end

  #protected
  def event_params
    params.require(:event).permit(:name, :description)
  end

  def set_event
    @event = Event.find(params[:id])
  end


end
