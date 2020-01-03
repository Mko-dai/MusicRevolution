class Artist < ApplicationRecord

  has_many :audios                           # 一人のアーティストは複数の楽曲(ユーザーが投稿した楽曲)を所有
  has_many :groups                           # 一人のアーティストは複数のユーザーチャットグループを所有
  has_many :users, through: :user_artists    # 一人のアーティストは複数のユーザーにフォローされる(中間テーブルのusers_artistsテーブルを経由)
  has_many :images                           # 一人のアーティストは複数の写真を所有
  


end
