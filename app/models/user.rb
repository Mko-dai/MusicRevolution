class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :audios                              # ユーザーは複数の楽曲データを所有 -->
  has_many :groups, through: :members           # ユーザーは複数のグループに所属(中間テーブルのmembersテーブルを経由) -->
  has_many :chats                               # ユーザーは複数のチャットを送信できる -->
  has_many :artists, through: :users_artists    # ユーザーは複数のアーティストをフォローできる(中間テーブルのusers_artistsテーブルを経由) -->
  has_many :follows                             # ユーザーは複数のユーザーをフォローできる -->
  has_many :follwers                            # ユーザーは複数のユーザーにフォローされる -->
  has_many :comments                            # ユーザーは投稿に対し、複数のコメントを残すことができる -->
  has_many :audios, through: :likes             # ユーザーはlikesテーブルを中間テーブルとし、複数の楽曲にいいねをつけることができる -->
  has_many :images                              # ユーザーはアーティストの画像を複数枚投稿できる -->
         

end
