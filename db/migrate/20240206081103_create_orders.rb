class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.text :group,           null: false
      t.text :content,         null: false
      t.text :payment,         null: false
      t.date :event_day
      t.date :date_of_payment
      t.timestamps
    end
  end
end
