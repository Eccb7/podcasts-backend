json.extract! podcast, :id, :title, :description, :audio_file, :category_id, :created_at, :updated_at
json.url podcast_url(podcast, format: :json)
json.audio_file url_for(podcast.audio_file)
