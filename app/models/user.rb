class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  include Devise::JWT::RevocationStrategies::JTIMatcher

  has_many :subscriber_subscriptions, :foreign_key => 'subscriber_id', class_name: "Subscription"
  has_many :subscribee_subscriptions, :foreign_key => 'subscribee_id', class_name: "Subscription"

  has_many :subscribers, through: :subscribee_subscriptions, source: :subscriber
  has_many :subscribees, through: :subscriber_subscriptions, source: :subscribee

  devise :database_authenticatable, :registerable, :validatable,
         :jwt_authenticatable, jwt_revocation_strategy: self
end
