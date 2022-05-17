class UsersController < ApplicationController
  def show
    @event = Event.where(creator_id: current_user)
  end
end
