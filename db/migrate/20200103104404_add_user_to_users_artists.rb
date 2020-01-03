class AddUserToUsersArtists < ActiveRecord::Migration[5.2]
  def change
    add_reference :user_artists, :user, foreign_key: true
    add_reference :user_artists, :artist, foreign_key: true
  end
end
