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
    @message = Message.new
  end

  def index
    if params[:query].present?
      sql_query = "name ILIKE :query OR category ILIKE :query"
      @rooms = Room.where(sql_query, query: "%#{params[:query]}%")
    else
      @rooms = Room.all
    end
  end

  def destroy
    @room = Room.find(params[:id])
    if @room.user == current_user
      @room.destroy
      redirect_to root_path, status: :see_other
    else
      redirect_to room_path
    end
  end

  def autodestruction
    @room = Room.find(params[:id])
    now = DateTime.now
    final = @room.date_end
    @room.destroy if now >= final
  end

  private

  def room_params
    params.require(:room).permit(:name, :location, :category, :start_date, :end_date, :motion, :description, :password, :user_id)
  end
end
