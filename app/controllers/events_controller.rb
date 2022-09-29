class EventsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update]

  def index
    @events = Event.all
    @future_events = Event.future
    @past_events = Event.past
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = Event.new
  end

  def create
    @event = current_user.events.create(event_params)
    # binding.pry
    if @event.save
      redirect_to @event
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    set_event
  end

  def update
    set_event

    if @event.update(event_params)
      redirect_to @event
    else
      render :edit, status: unprocessable_entity
    end
  end

  def attend_event
    @event = Event.find(params[:event_id])
    @event_attendee = EventAttendee.new(user_id: current_user.id, event_id: @event.id)

    if @event_attendee.save
      redirect_to @event
    else
      render :show, status: :unprocessable_entity
    end
  end

  def remove_attendance
    @event = Event.find(params[:event_id])
    @booking = EventAttendee.find_by(event_id: @event.id, user_id: current_user.id)
    @booking.destroy

    redirect_to @event
  end

  private

  def event_params
    params.require(:event).permit(:name, :location, :description, :datetime)
  end
end
