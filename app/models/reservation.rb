class Reservation < ApplicationRecord
  belongs_to :room
  belongs_to :user

  def total_price
    (check_out - check_in).to_i * room.price * guests
  end
  validates :check_in, presence: true
  validates :check_out, presence: true
  validates :guests, presence: true, numericality: { greater_than_or_equal_to: 1 }

  validate :check_in_date_cannot_be_in_the_past
  validate :check_out_date_after_check_in

  def total_price
    return 0 if check_in.nil? || check_out.nil? || guests.nil?
  
    (check_out - check_in).to_i * room.price * guests
  end
  

  private

  def check_in_date_cannot_be_in_the_past
    if check_in.present? && check_in < Date.today
      errors.add(:check_in, "は本日以降の日付を選択してください")
    end
  end

  def check_out_date_after_check_in
    if check_in.present? && check_out.present? && check_out <= check_in
      errors.add(:check_out, "はチェックインより後の日付を選択してください")
    end
  end
end
