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
### 6.アーティストの紹介ページを作成し、ユーザーがアーティストの情報を登録・編集・閲覧できるようにする

## オプション機能
### 1.グループ内で他のユーザーがメッセージを入力中に"〇〇さんがメッセージを入力中です"と表示させる
### 2.ユーザー名とアーティスト名とグループ名をインクリメンタルサーチで検索

# DB設計
## usersテーブル
|Column|Type|Options|
|-----|----|-------|
|nickname|string|null: false|    <!-- ニックネーム -->
|email|string|null: false|       <!-- メールアドレス -->
|password|string|null: false|    <!-- パスワード -->
|introduction|text|-------|      <!-- プロフィール文 -->


### Association
- has_many :audios                              <!-- ユーザーは複数の楽曲データを所有 -->
- has_many :groups, through: :members           <!-- ユーザーは複数のグループに所属(中間テーブルのmembersテーブルを経由) -->
- has_many :chats                               <!-- ユーザーは複数のチャットを送信できる -->
- has_many :artists, through: :users_artists    <!-- ユーザーは複数のアーティストをフォローできる(中間テーブルのusers_artistsテーブルを経由) -->
- has_many :follows                             <!-- ユーザーは複数のユーザーをフォローできる -->

## followsテーブル
|Column|Type|Options|
|-----|----|-------|
|follow_user_id|integer|null:false|                <!-- フォローするユーザーのid -->
|user|reference|null: false, foreign_key: true|     <!-- userの外部キー -->

### Association
- belongs_to :user                     <!-- ユーザーは複数のfollows情報を所有 -->

##  audiosテーブル
|Column|Type|Options|
|-----|----|-------|
|title|string|null:false|        <!-- 楽曲のタイトル -->
|category|string|-------|        <!-- 楽曲のジャンル　-->
|artist|string|null:false|       <!-- アーティスト -->
|image|string|-------|           <!-- 楽曲の画像 -->
|file|string|null:false|        <!-- 楽曲ファイル -->
|description|text|-------|       <!-- 楽曲の説明(ユーザーによる紹介文または一押しポイント) -->
|user|reference|null: false, foreign_key: true|     <!-- userの外部キー -->
|artist|reference|null: false, foreign_key: true|   <!-- artistの外部キー -->

### Association
- belongs_to :user                     <!-- 一つの楽曲は一人のユーザーに帰属 -->
- belongs_to :artist                   <!-- 一つの楽曲は一人のアーティストに帰属 -->

## artistsテーブル
|Column|Type|Options|
|-----|----|-------|
|name|string|null:false|          <!-- アーティスト名 -->
|image|string|-------|            <!-- アーティストの画像 -->
|description|text|null:false|     <!-- アーティストの説明 -->

### Association
- has_many :audios                           <!-- 一人のアーティストは複数の楽曲(ユーザーが投稿した楽曲)を所有 -->
- has_many :groups                           <!-- 一人のアーティストは複数のユーザーチャットグループを所有 -->
- has_many :users, through: :users_artists   <!-- 一人のアーティストは複数のユーザーにフォローされる(中間テーブルのusers_artistsテーブルを経由) -->

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
|text|text|null:false|           <!-- チャットの内容 -->
|image|string|-------|           <!-- チャットで送信する画像 -->
|user|reference|null: false, foreign_key: true|    <!-- userの外部キー -->
|group|reference|null: false, foreign_key: true|   <!-- グループの外部キー -->

### Association
- belongs_to :user               <!-- 一つのチャットは一人のユーザーが送信 -->
- belongs_to :group　　　　　　　　 <!-- 一つのチャットは一つのグループに所属 -->

## groupsテーブル　　　　　　　　　　　
|Column|Type|Options|
|-----|----|-------|
|name|string|null:false|　　　　　　<!-- グループ名 -->
|artist|reference|null: false, foreign_key: true|    <!-- アーティストの外部キー -->

### Association
- has_many :users, through: :members      <!-- グループは複数のユーザーが所属(中間テーブルのmembersテーブルを経由) -->
- has_many :chats   　　　　　　　　　　　　　<!-- グループでは複数のチャットが交わされる -->
- belongs_to :artist                      <!-- グループには一人のアーティストが存在 -->

## membersテーブル
|Column|Type|Options|
|-----|----|-------|
|user|reference|null: false, foreign_key: true|    <!-- userの外部キー -->
|group|reference|null: false, foreign_key: true|   <!-- グループの外部キー -->

### Association
- belongs_to :user
- belongs_to :group


