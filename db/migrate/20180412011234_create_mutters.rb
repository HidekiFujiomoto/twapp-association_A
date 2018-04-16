class CreateMutters < ActiveRecord::Migration[5.1]
  def change
    create_table :mutters do |t|
      t.text :content
    end
  end
end
