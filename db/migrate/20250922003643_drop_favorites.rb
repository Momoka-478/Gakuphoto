class DropFavorites < ActiveRecord::Migration[6.1]
  def change
    drop_table :favorites, if_exists: true
  end
end
