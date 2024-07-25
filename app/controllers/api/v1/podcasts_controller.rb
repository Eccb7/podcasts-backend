module Api
  module V1
    class PodcastsController < ApplicationController
      before_action :set_podcast, only: [:show, :update, :destroy]

      # GET /api/v1/podcasts
      def index
        @podcasts = Podcast.all

        render json: @podcasts
      end

      # GET /api/v1/podcasts/:id
      def show
        render json: @podcast
      end

      # POST /api/v1/podcasts
      def create
        @podcast = Podcast.new(podcast_params)

        if @podcast.save
          render json: @podcast, status: :created, location: api_v1_podcast_url(@podcast)
        else
          render json: @podcast.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /api/v1/podcasts/:id
      def update
        if @podcast.update(podcast_params)
          render json: @podcast
        else
          render json: @podcast.errors, status: :unprocessable_entity
        end
      end

      # DELETE /api/v1/podcasts/:id
      def destroy
        @podcast.destroy
      end

      private

        def set_podcast
          @podcast = Podcast.find(params[:id])
        end

        def podcast_params
          params.require(:podcast).permit(:title, :description, :audio_file, :category_id)
        end
    end
  end
end
