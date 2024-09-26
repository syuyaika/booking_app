class RoomsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_room, only: [:show, :edit, :update, :destroy]
  def index
    if current_user
      @rooms = current_user.rooms
    else
      @rooms = Room.all
    end
  end

  def show
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
    @rooms = Room.where('name LIKE ? OR details LIKE ? OR address LIKE ?', "%#{params[:query]}%", "%#{params[:query]}%", "%#{params[:query]}%")
  end
  
end
