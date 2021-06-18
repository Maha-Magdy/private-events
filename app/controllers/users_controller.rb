class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @past_events = @user.attended_events.past_events
    @future_events = @user.attended_events.future_events
  end
end
