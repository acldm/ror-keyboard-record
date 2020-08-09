class AddUserIdColumnToRecord < ActiveRecord::Migration[6.0]
  def change
    add_column :records, :user_id, :integer, :references => "users"
  end
end
