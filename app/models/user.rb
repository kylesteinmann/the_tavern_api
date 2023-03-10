class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  include Devise::JWT::RevocationStrategies::JTIMatcher

  has_many :subscriptions, :foreign_key => 'subscriber_id'
  has_many :subs, through: :subscriptions, source: "subscribee", :class_name => 'User', :foreign_key => 'subscribee_id'
  has_many :subscribers, through: :subscriptions, source: "subscriber", :class_name => 'User', :foreign_key => 'subscriber_id'

  devise :database_authenticatable, :registerable, :validatable,
         :jwt_authenticatable, jwt_revocation_strategy: self
end
