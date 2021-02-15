class Message < ApplicationRecord
  belongs_to :user
  belongs_to :channel

  validates :content, presence: true
  validates :content, length: { in: 1..250 }
end
