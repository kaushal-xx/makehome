class AddUserIdColumnToFeedback < ActiveRecord::Migration[6.0]
  def change
  	add_column :feedbacks, :user_id, :integer
  end
end
