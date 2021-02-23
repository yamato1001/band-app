class Bandpost < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_one_attached :video


  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :genre
  belongs_to :area
  belongs_to :musical_instrument

  validates :bandname, :introduction, presence: true
  validates :genre_id, :area_id, :musical_instrument_id, numericality: { other_than: 1 } 
end
