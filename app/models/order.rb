class Order < ApplicationRecord
  has_many :order_users, dependent: :destroy
  has_many :users, through: :order_users
  accepts_nested_attributes_for :order_users

  with_options presence: true do
    validates :group
    validates :content
    validates :payment
  end

  def start_time
    event_day
  end
end
