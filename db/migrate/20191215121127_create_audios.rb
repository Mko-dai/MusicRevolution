class CreateAudios < ActiveRecord::Migration[5.2]
  def change
    create_table :audios do |t|
      t.string         :title,        null: false
      t.string         :category
      t.string         :image
      t.string         :file,          null: false
      t.text           :description
      t.string         :artistname
      t.timestamps
    end
  end
end
