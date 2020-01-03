class Comment < ApplicationRecord

belongs_to :user    # 一つのコメントは一人のユーザーに帰属
belongs_to :audio   # 一つのコメントは一人の楽曲に帰属
  


end
