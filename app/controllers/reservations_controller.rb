class ReservationsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_room
  before_action :set_reservation, only: [:edit, :update, :destroy]

  def index
    @reservations = current_user.reservations
  end

  def new
    @reservation = @room.reservations.build
  end

  def create
    @reservation = @room.reservations.build(reservation_params)
    @reservation.user = current_user
    if @reservation.save
      redirect_to room_reservations_path(@room), notice: '予約が完了しました'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @reservation.update(reservation_params)
      redirect_to room_reservations_path(@room), notice: '予約を更新しました'
    else
      render :edit
    end
  end

  def destroy
    @reservation.destroy
    redirect_to room_reservations_path(@room), notice: '予約を削除しました'
  end

  private

  def set_room
    @room = Room.find(params[:room_id])
  end

  def set_reservation
    @reservation = @room.reservations.find(params[:id])
  end

  def reservation_params
    params.require(:reservation).permit(:check_in, :check_out, :guests)
  end
end
