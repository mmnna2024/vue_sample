class Order < ApplicationRecord
  belongs_to :user
  belongs_to :shipping_address
  has_many :items

  enum status: [:waiting, :doing, :done]
  enum channel: [:shop, :phonecall, :website]
end
