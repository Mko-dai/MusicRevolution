class CreateUserArtists < ActiveRecord::Migration[5.2]
  def change
    create_table :user_artists do |t|

      t.timestamps
    end
  end
end
