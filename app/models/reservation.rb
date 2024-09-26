class Reservation < ApplicationRecord
  belongs_to :room
  belongs_to :user

  def total_price
    (check_out - check_in).to_i * room.price * guests
  end
end
