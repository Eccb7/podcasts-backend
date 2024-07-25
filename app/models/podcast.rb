class Podcast < ApplicationRecord
  belongs_to :category
  has_one_attached :audio_file
end
