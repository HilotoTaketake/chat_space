# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
# ChatSpace DB設計
## usersテーブル
|Column|Type|Options|
|------|----|-------|
|email|string|null: false,unique:true|
|name|string|null: false,index:true|
### Association
- has_many :groups_users
- has_many :messages
- has_many :groups, through::groups_users

## messagesテーブル
|Column|Type|Options|
|------|----|-------|
|body|text|
|image|string|
|group_id|integer|null: false, foreign_key: true|
|user_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :user
- belongs_to :group
|email|string|null: false|
|password|string|null: false|
|username|string|null: false|
### Association
- has_many :groups
- has_many :chats

## chatsテーブル
|Column|Type|Options|
|------|----|-------|
|text|text|null: false|
|image|string|null: false|
|groups|string|null: false|
|user_id|integer|null: false, foreign_key: true|
|members_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :users
- belongs_to :members
- belongs_to :groups

## groupsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false,unique:true|
### Association
- has_many :groups_users
- has_many :messages
- has_many :users, through:  :groups_users


## groups_usersテーブル
|Column|Type|Options|
|------|----|-------|
|group_id|integer|null: false, foreign_key: true|
|user_id|string|null: false, foreign_key:true|
### Association
- belongs_to :group
- belongs_to :user
|name|string|null: false|
|members_name|string|null: false|
### Association
- has_one :chat
- has_many :members,  through:  :groups_members

## membersテーブル
|Column|Type|Options|
|------|----|-------|
|members_name|string|null: false|
### Association
- has_many :members,  through:  :groups_members

## groups_memberテーブル
|Column|Type|Options|
|------|----|-------|
|groups_id|integer|null: false, foreign_key: true|
|members_id|string|null: false|
### Association
belongs_to :groups
belongs_to :groups_chat
