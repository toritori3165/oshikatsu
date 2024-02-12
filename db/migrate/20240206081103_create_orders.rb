class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.string :group,           null: false
      t.string :content_name
      t.string :event_name
      t.string :price
      t.text :memo
      t.date :event_day
      t.date :date_of_payment
      t.timestamps
    end
  end
end
