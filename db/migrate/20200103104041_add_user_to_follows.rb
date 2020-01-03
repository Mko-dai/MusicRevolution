class AddUserToFollows < ActiveRecord::Migration[5.2]
  def change
    add_reference :follows, :user, foreign_key: true
    add_reference :follows, :follower, foreign_key: true
  end
end
