class EventsController < ApplicationController
  before_action :require_login, only: [:new, :create]

  def index
    @event = Event.all
  end

  def show
    @event = Event.find(params[:id])
    @attendees = Event.find(params[:id]).attendees
  end

  def new
    @event = Event.new
  end

  def create
    @event = current_user.created_events.build(user_params)

    if @event.save
      flash[:success] = "Great! Your event has been created!"
      redirect_to events_url
    else
      flash.now[:error] = "Rats! Fix your mistakes, please."
      render :new, status: :unprocessable_entity
    end
  end

  def attend
    @event = Event.find(params[:id])
    if @event.attendees.include?(current_user)
      redirect_to @event, notice: "You are already on the list"
    else
      @event.attendees << current_user
      redirect_to @event
    end
  end
  
  private

  def user_params
    params.require(:event).permit(:title, :location, :description, :event_date, :creator_id)
  end

  def require_login
    unless user_signed_in?
      flash[:error] = "You must be logged in to access this section"
      redirect_to new_user_session_path # halts request cycle
    end
  end

end
