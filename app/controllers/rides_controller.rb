class RidesController < ApplicationController

  def new
    binding.pry
    @ride = Ride.new(:user_id => params[:user_id], :attraction_id => params[:attraction_id])
    redirect_to user_path(@ride.user, message: @ride.take_ride)
  end

  private

  def ride_params
    params.require(:ride).permit(:user_id, :attraction_id)
  end

end
