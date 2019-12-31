class AddUserToAudios < ActiveRecord::Migration[5.2]
  def change
    add_reference :audios, :user,   null: false,   foreign_key: true
    add_reference :audios, :artist,                foreign_key: true
  end
end
