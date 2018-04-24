class AddUserIdToMutters < ActiveRecord::Migration[5.1]
  def change
    add_column :mutters, :user_id, :integer
  end
end
