# README

## アプリ名
# MusicRevolution

## アプリ概要
# 音楽好きユーザーのための出会い系アプリ

## 実装機能
### 1.ユーザーはお気に入りの楽曲をrootページに投稿できる
### 2.ユーザーはグループを作成し、他のユーザーとチャットができる
### 3.各グループはアーティストと結びつき、グループ内ではそのアーティストについてのチャットができる
### 4.rootページではフォローしているアーティストの楽曲（ユーザーが投稿した楽曲）と、フォローしているユーザーが投稿した楽曲（フォローしていないアーティストの楽曲も含む）が閲覧できる
### 5.ユーザーのマイページを作成し、ユーザーが情報を登録・編集・閲覧できるようにする
### 6.アーティストの紹介ページを作成し、ユーザーがアーティストの情報を登録・編集・閲覧できるようにする(紹介項目もユーザーが自由に追加・削除できる)

## オプション機能
### 1.グループ内で他のユーザーがメッセージを入力中に"〇〇さんがメッセージを入力中です"と表示させる
### 2.ユーザー名とアーティスト名とグループ名をインクリメンタルサーチで検索
### 3.グループトーク&コメント時に@~でメンションをつけて、ユーザーを検索することができる
### 4.フォロワーのみがフォロー中のユーザーのマイページを閲覧できる
### 5.ログインパスワードを忘れたユーザーのためのパスワード変更機能
### 6.楽曲のいいね機能

# DB設計
## usersテーブル
|Column|Type|Options|
|-----|----|-------|
|nickname|string|null: false|    <!-- ニックネーム -->
|email|string|null: false|       <!-- メールアドレス -->
|image|string|------|            <!-- プロフィール画像 -->
|background|string|-----|        <!-- 背景画像 -->
|password|string|null: false|    <!-- パスワード -->
|introduction|text|-------|      <!-- プロフィール文 -->


### Association
- has_many :audios                              <!-- ユーザーは複数の楽曲データを所有 -->
- has_many :groups, through: :members           <!-- ユーザーは複数のグループに所属(中間テーブルのmembersテーブルを経由) -->
- has_many :chats                               <!-- ユーザーは複数のチャットを送信できる -->
- has_many :artists, through: :users_artists    <!-- ユーザーは複数のアーティストをフォローできる(中間テーブルのusers_artistsテーブルを経由) -->
- has_many :follows                               <!-- ユーザーは複数のユーザーをフォローできる -->
- has_many :follwers                               <!-- ユーザーは複数のユーザーにフォローされる -->
- has_many :comments                           <!-- ユーザーは投稿に対し、複数のコメントを残すことができる -->
- has_many :likes                              <!-- ユーザーはlikesテーブルを中間テーブルとし、複数の楽曲にいいねをつけることができる -->
- has_many :images                             <!-- ユーザーはアーティストの画像を複数枚投稿できる -->

## followsテーブル
|Column|Type|Options|
|-----|----|-------|
|user|reference|null: false, foreign_key: true|        <!-- userの外部キー -->
|follower|reference|null: false, foreign_key: true|    <!--followerの外部キー -->

### Association
- belongs_to :user                     <!-- ユーザーは複数のfollows情報を所有 -->
- belongs_to :follower                <!-- ユーザーはfollowsテーブルを中間テーブルとして、一人のフォローユーザーを所有 -->

## followersテーブル
|Column|Type|Options|
|-----|----|-------|
|user|reference|null: false, foreign_key: true|     <!-- userの外部キー -->

### Association
- belongs_to :user                     <!-- ユーザーは複数のfollowers情報を所有 -->
- has_many :follows                    <!-- フォロワーは複数のフォローユーザーを所有 -->

##  audiosテーブル
|Column|Type|Options|
|-----|----|-------|
|title|string|null:false|        <!-- 楽曲のタイトル -->
|category|string|-------|        <!-- 楽曲のジャンル -->
|image|string|-------|           <!-- 楽曲の画像 -->
|file|string|null:false|        <!-- 楽曲ファイル -->
|description|text|-------|       <!-- 楽曲の説明(ユーザーによる紹介文または一押しポイント) -->
|user|reference|null: false, foreign_key: true|     <!-- userの外部キー -->
|artist|reference|null: false, foreign_key: true|   <!-- artistの外部キー -->

### Association
- belongs_to :user                     <!-- 一つの楽曲は一人のユーザーに帰属 -->
- belongs_to :artist                   <!-- 一つの楽曲は一人のアーティストに帰属 -->
- has_many :comments                   <!-- 一つの楽曲は複数のユーザーのコメントを所有-->
- has_many :likes                      <!-- 一つの楽曲はlikesテーブルを中間テーブルとし、複数のユーザーからいいねをもらう-->

## likesテーブル
|Column|Type|Options|
|-----|----|-------|
|user|reference|null: false, foreign_key: true|     <!-- userの外部キー -->
|audio|reference|null: false, foreign_key: true|   <!-- audioの外部キー -->

### Association
- belongs_to :user                     <!-- 一つのいいねは一人のユーザーに帰属 -->
- belongs_to :audios                   <!-- 一つのいいねは一つの楽曲に帰属 -->

## commentsテーブル
|Column|Type|Options|
|-----|----|-------|
|comment|text|null: false|
|user|reference|null: false, foreign_key: true|     <!-- userの外部キー -->
|audio|reference|null: false, foreign_key: true|   <!-- audioの外部キー -->

### Association
- belongs_to :user                <!-- 一つのコメントは一人のユーザーに帰属 -->
- belongs_to :audio               <!-- 一つのコメントは一人の楽曲に帰属 -->


## artistsテーブル
|Column|Type|Options|
|-----|----|-------|
|name|string|null:false|          <!-- アーティスト名 -->
|description|text|null:false|     <!-- アーティストの概要 -->

### Association
- has_many :audios                           <!-- 一人のアーティストは複数の楽曲(ユーザーが投稿した楽曲)を所有 -->
- has_many :groups                           <!-- 一人のアーティストは複数のユーザーチャットグループを所有 -->
- has_many :users, through: :users_artists   <!-- 一人のアーティストは複数のユーザーにフォローされる(中間テーブルのusers_artistsテーブルを経由) -->
- has_many :images　<!-- 一人のアーティストは複数の写真を所有 -->

## imagesテーブル
|Column|Type|Options|
|-----|----|-------|
|artist|reference|null: false, foreign_key: true|     <!-- artistの外部キー -->
|user|reference|null: false, foreign_key: true|       <!-- userの外部キー -->
|image|text|-------|     <!-- アーティストの画像 -->

### Association
belongs_to :artist
belongs_to :user

## users_artistsテーブル
|Column|Type|Options|
|-----|----|-------|
|user|reference|null: false, foreign_key: true|       <!-- userの外部キー -->
|artist|reference|null: false, foreign_key: true|     <!-- artistの外部キー -->

### Association
- belongs_to :user
- belongs_to :artist

## chatsテーブル
|Column|Type|Options|
|-----|----|-------|
|text|text||                     <!-- チャットの内容 -->
|image|string|-------|           <!-- チャットで送信する画像 -->
|user|reference|null: false, foreign_key: true|    <!-- userの外部キー -->
|group|reference|null: false, foreign_key: true|   <!-- グループの外部キー -->

### Association
- belongs_to :user               <!-- 一つのチャットは一人のユーザーが送信 -->
- belongs_to :group               <!-- 一つのチャットは一つのグループに所属 -->

## groupsテーブル
|Column|Type|Options|
|-----|----|-------|
|name|string|null:false|                             <!-- グループ名 -->
|artist|reference|null: false, foreign_key: true|    <!-- アーティストの外部キー -->

### Association
- has_many :users, through: :members      <!-- グループは複数のユーザーが所属(中間テーブルのmembersテーブルを経由) -->
- has_many :chats                         <!-- グループでは複数のチャットが交わされる -->
- belongs_to :artist                      <!-- グループには一人のアーティストが存在 -->

## membersテーブル
|Column|Type|Options|
|-----|----|-------|
|user|reference|null: false, foreign_key: true|    <!-- userの外部キー -->
|group|reference|null: false, foreign_key: true|   <!-- グループの外部キー -->

### Association
- belongs_to :user
- belongs_to :group


