class PodcastSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  
  attributes :id, :title, :description, :audio_file_url, :category_id

  def audio_file_url
    Rails.application.routes.url_helpers.rails_blob_url(object.audio_file, only_path: true) if object.audio_file.attached?
  end
end
