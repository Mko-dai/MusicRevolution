class AddUserToLikes < ActiveRecord::Migration[5.2]
  def change
    add_reference :likes, :user, foreign_key: true
    add_reference :likes, :audio, foreign_key: true
  end
end
