class Audio < ApplicationRecord
  mount_uploader :file, AudioFileUploader
  mount_uploader :image, ImageUploader

  belongs_to :user                     # 一つの楽曲は一人のユーザーに帰属 -->
  belongs_to :artist                   # 一つの楽曲は一人のアーティストに帰属 -->
  has_many :comments                   # 一つの楽曲は複数のユーザーのコメントを所有-->
  has_many :users,through: :likes      # 一つの楽曲はlikesテーブルを中間テーブルとし、複数のユーザーからいいねをもらう-->
  
  validates :title, presence: true
  # validates :file,  presence: true


end
