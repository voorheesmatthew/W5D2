class UpdateUserId < ActiveRecord::Migration[5.2]
  def change
    remove_column :subs, :user_id
    add_column :subs, :user_id, :integer, null: false
  end
end
