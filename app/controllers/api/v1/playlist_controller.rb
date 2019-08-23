module Api
    module V1
        class PlaylistController < ApplicationController
            # before actions

            # should only work if nested under user
            def index
                @playlists = Playlist.find(user_id: params[:user_id])

                render json: @playlists
            end

            # should only work without nesting
            def show
                @playlist = Playlist.find(params[:id])

                render json: @playlist
            end

            # should only work if nested under a user
            def create
                @playlist = Playlist.new(playlist_params)
                @playlist.save! # throw an exception

                render json: @playlist
            end
        end
    end
end