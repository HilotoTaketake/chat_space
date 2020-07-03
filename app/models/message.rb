class Message < ApplicationRecord
  belongs_to :group
  belongs_to :user

  validates :content, presence: true, unless: :image? #両方ののカラムが空の場合保存しませんよ
  mount_uploader :image, ImageUploader
end
