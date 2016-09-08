class CreateMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :messages do |t|
      t.text :text, length: { min: 1, max: 250 }, null: false
      t.timestamps
    end
    add_reference :messages, :user, index: true
  end
end
