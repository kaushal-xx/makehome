class CreateCallHistories < ActiveRecord::Migration[6.0]
  def change
    create_table :call_histories do |t|
      t.string :caller_name
      t.string :caller_mobile
      t.string :username
      t.string :user_mobile
      t.datetime :date

      t.timestamps
    end
  end
end
