class EnrollmentsController < ApplicationController
  def create
    @enrollment = Enrollment.new(enrollment_params)
    if Enrollment.where(user_id: current_user.id, event_id: @enrollment.event_id).first.nil?
      @enrollment.save
      redirect_to event_path(@enrollment.event_id), notice: 'You have just enrolled, Welcome to the event.'
    else
      redirect_to event_path(@enrollment.event_id), notice: 'You have already enrolled once!'
    end
  end

  private

  def enrollment_params
    params.require(:enrollment).permit(:user_id, :event_id)
  end
end
