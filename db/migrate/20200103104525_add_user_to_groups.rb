class AddUserToGroups < ActiveRecord::Migration[5.2]
  def change
    add_reference :groups, :artist, foreign_key: true
  end
end
