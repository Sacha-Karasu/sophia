class RoomsController < ApplicationController
  def new
    @room = Room.new
  end

  def create
    @room = Room.new(room_params)
    @room.user = current_user
    if @room.save
      redirect_to room_path(@room)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @room = Room.find(params[:id])
  end

  def index
    @rooms = Room.all
  end

  private

  def room_params
    params.require(:room).permit(:name, :location, :category, :start_date, :end_date, :motion, :description, :password, :user_id)
  end
end
