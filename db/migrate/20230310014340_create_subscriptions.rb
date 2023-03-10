class CreateSubscriptions < ActiveRecord::Migration[7.0]
  def change
    create_table :subscriptions do |t|
      t.references :subscriber, null: false
      t.references :subscribee, null: false

      t.timestamps
    end
    add_foreign_key :subscriptions, :users, column: :subscriber_id, primary_key: :id
    add_foreign_key :subscriptions, :users, column: :subscribee_id, primary_key: :id
  end
end
