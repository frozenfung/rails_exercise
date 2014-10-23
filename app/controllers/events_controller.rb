class EventsController < ApplicationController
  

  def index
    @events = Event.all
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

    redirect_to :action => :index
  end

  # GET
  def show
    @event = Event.find(params[:id])

    @page_title = @event.name
  end

  # GET
  def edit
    @event = Event.find(params[:id])
  end


  # GET
  def update
    @event = Event.find(params[:id])
    @event.update_attributes(event_params)

    redirect_to :action => :show, :id => @event
  end

  #
  def destroy
    @event = Event.find(params[:id])
    @event.destroy

    redirect_to :action => :index
  end

  #protected
  def event_params
    params.require(:event).permit(:name, :description)
  end

end
