class Subscription < ApplicationRecord
  belongs_to :subscriber, class_name: 'User', foreign_key: :subscriber_id
  belongs_to :subscribee, class_name: 'User', foreign_key: :subscribee_id
end
