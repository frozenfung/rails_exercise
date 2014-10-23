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
  end

  #protected
  def event_params
    params.require(:event).permit(:name, :description)
  end

end
