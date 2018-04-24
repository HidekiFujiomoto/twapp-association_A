class RemoveMutterIdFromMutters < ActiveRecord::Migration[5.1]
  def change
    remove_column :mutters, :mutter_id, :text
  end
end
