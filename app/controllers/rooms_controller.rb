class RoomsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:nomade]

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
    @messages = @room.messages
    if params[:query].present?
      sql_query = "content ILIKE :query"
      @messages = @messages.where(sql_query, query: "%#{params[:query]}%")
    end
    @message = Message.new
  end

  def index
    if params[:query].present?
      sql_query = "name ILIKE :query OR category ILIKE :query"
      @rooms = Room.where(sql_query, query: "%#{params[:query]}%")
    else
      @rooms = Room.all
    end
    @room = Room.new
    # The `geocoded` scope filters only rooms with coordinates
    @markers = @rooms.geocoded.map do |room|
      {
        lat: room.latitude,
        lng: room.longitude,
        info_window: render_to_string(partial: "info_window", locals: {room: room})
      }
    end
    # Rooms dans lesquelles user a au moins 1 message
    @rooms_with_messages_in = current_user.rooms

    @rooms_around_user = Room.near([current_user.latitude.to_f, current_user.longitude.to_f], 1, units: :km)
  end

  def fav
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

  def nomade
    @room = Room.find(params["room"])
    @room.update!(latitude: params["latitude"], longitude: params["longitude"])
  end

  private

  def room_params
    params.require(:room).permit(:name, :location, :category, :start_date, :end_date, :motion, :description, :password, :user_id)
  end
end
