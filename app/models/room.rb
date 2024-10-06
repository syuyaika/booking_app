class Room < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_many :reservations, dependent: :destroy  
  validates :name, presence: true
  validates :description, presence: true
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 1 }
  validates :address, presence: true

  def self.search(area: nil, keyword: nil)
    rooms = Room.all

    if area.present?
      areas = %w(東京 大阪 京都 札幌)
      if areas.include?(area)
        rooms = rooms.where("address LIKE ?", "%#{area}%")
      end
    end

    if keyword.present?
      rooms = rooms.where("name LIKE ? OR description LIKE ?", "%#{keyword}%", "%#{keyword}%")
    end

    rooms
  end
  
end
