class SetDefault < ActiveRecord::Migration[5.2]
  def change
    change_column :posts, :likes_count, :integer, null: true, default: 0
  end
end
