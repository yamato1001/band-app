class Solopost < ApplicationRecord
  belongs_to :user
  has_one_attached :video

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :genre
  belongs_to :area
  belongs_to :musical_instrument
end
