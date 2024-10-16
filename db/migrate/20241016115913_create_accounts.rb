class CreateAccounts < ActiveRecord::Migration[7.2]
  def change
    create_table :accounts do |t|
      t.string :account_number
      t.string :account_holder_name
      t.decimal :opening_amount
      t.decimal :opening_bonus
      t.decimal :closing_amount
      t.references :bank, null: false, foreign_key: true

      t.timestamps
    end
  end
end
