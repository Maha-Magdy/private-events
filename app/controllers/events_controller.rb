class EventsController < ApplicationController
  def index
    @events = Event.all
    @past_events = Event.past_events
    @future_events = Event.future_events
  end

  def new
    @event = Event.new
  end

  def create
    @event = current_user.events.create(event_params)
    if @event.save
      redirect_to @event
    else
      render 'new'
    end
  end

  def show
    @event = Event.find(params[:id])
    @creator = @event.creator[:name]
  end

  private

  def event_params
    params.require(:event).permit(:name, :date)
  end
end
