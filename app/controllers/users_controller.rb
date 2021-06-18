class UsersController < ApplicationController
    def show
        @user = User.find(params[:id])
        @past_events = @user.attended_events.where("date < ?", Date.today)
        @future_events = @user.attended_events.where("date >= ?", Date.today)
    end
end
