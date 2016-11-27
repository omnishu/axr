class Site < ApplicationRecord
  belongs_to :user

  validates_uniqueness_of :url, scope: :user_id, message: 'This url is already added'
  validates :url, presence: true
  validates :url, format: { with: URI.regexp }, if: 'url.present?'
end
