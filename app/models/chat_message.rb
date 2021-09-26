class ChatMessage < ApplicationRecord
  belongs_to :user
  belongs_to :chat_room

  after_create_commit { ChatMessageBroadcastJob.perform_later self }
  validates :content, presence: true
end
