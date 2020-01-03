class Chat < ApplicationRecord

  belongs_to :user   # 一つのチャットは一人のユーザーが送信
  belongs_to :group   # 一つのチャットは一つのグループに所属
  


end
