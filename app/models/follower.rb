class Follower < ApplicationRecord

  belongs_to :user                     # ユーザーは複数のfollowers情報を所有
  has_many :follows                    # フォロワーは複数のフォローユーザーを所有
  

end
