class EventsController < ApplicationController
  before_action :set_event, :only => [ :show, :edit, :update, :destroy]

  def index
    @events = Event.page(params[:page]).per(5)
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
      redirect_to :action => :index
    else
      render :action => :new
    end
  end

  # GET
  def show
    @page_title = @event.name
  end

  # GET
  def edit

  end


  # GET
  def update
    if @event.update_attributes(event_params)
      redirect_to :action => :show, :id => @event
    else
      render :action => :new
    
    end
  end

  #
  def destroy
    @event.destroy
    flash[:alert] = "event was successfully deleted"
    redirect_to :action => :index
  end

  #protected
  def event_params
    params.require(:event).permit(:name, :description)
  end

  def set_event
    @event = Event.find(params[:id])
  end


end
