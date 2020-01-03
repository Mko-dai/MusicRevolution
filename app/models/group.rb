class Group < ApplicationRecord

  has_many :users, through: :members      # グループは複数のユーザーが所属(中間テーブルのmembersテーブルを経由) -->
  has_many :chats                         # グループでは複数のチャットが交わされる -->
  belongs_to :artist                      # グループには一人のアーティストが存在 -->
  

end
