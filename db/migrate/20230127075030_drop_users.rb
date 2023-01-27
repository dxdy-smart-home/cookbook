class DropUsers < ActiveRecord::Migration[6.1]
  def up
    remove_column :dishes, :author_id
    remove_column :tags, :author_id
    remove_column :products, :author_id

    drop_table :users
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
