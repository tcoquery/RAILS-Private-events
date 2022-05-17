class UsersController < ApplicationController
  def show
    @event = Event.where(creator_id: current_user)
    @attended_event = current_user.attended_events
  end
end
