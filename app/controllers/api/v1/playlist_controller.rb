module Api
    module V1
        class PlaylistController < ApplicationController
            # before actions

            # should only work if nested under user
            def index
                @playlists = Playlist.all

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
            
            private
            
                # limit params
                def playlist_params
                    params.require(:playlist).permit(:name, :user_id)
                end

        end
    end
end