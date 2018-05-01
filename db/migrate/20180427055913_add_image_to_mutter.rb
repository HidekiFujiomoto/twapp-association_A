class AddImageToMutter < ActiveRecord::Migration[5.1]
  def change
    add_column :mutters, :image, :text
  end
end
