class Like < ApplicationRecord

  belongs_to :user       # 一つのいいねは一人のユーザーに帰属 -->
  belongs_to :audios     # 一つのいいねは一つの楽曲に帰属 -->
  

end
