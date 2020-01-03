class Follow < ApplicationRecord

belongs_to :user       # ユーザーは複数のfollows情報を所有 -->
belongs_to :follower  # ユーザーはfollowsテーブルを中間テーブルとして、一人のフォローユーザーを所有 -->
  

end
