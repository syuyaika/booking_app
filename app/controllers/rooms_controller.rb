class RoomsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show, :search]
  before_action :set_room, only: [:show, :edit, :update, :destroy]
  def index
    if current_user
      @rooms = current_user.rooms
    else
      @rooms = Room.all
    end
  end

  def show
    @room
  end

  def new
    @room = Room.new
  end

  def create
    @room = current_user.rooms.build(room_params)
    if @room.save
      redirect_to @room, notice: '保存しました'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @room.update(room_params)
      redirect_to @room, notice: '更新しました'
    else
      render :edit
    end
  end

  def destroy
    @room.destroy
    redirect_to rooms_url, notice: '削除しました'
  end

  def search
    query = params[:query]
    @rooms = Room.where('name LIKE ? OR details LIKE ? OR address LIKE ?', "%#{params[:query]}%", "%#{params[:query]}%", "%#{params[:query]}%")
    if params[:area].present?
      @rooms = @rooms.where("address LIKE ?", "%#{params[:area]}%")
    end
  end

  private

  def set_room
    @room = Room.find(params[:id])
  end

  def room_params
    params.require(:room).permit(:name, :description, :price, :address, :image)
  end

end
