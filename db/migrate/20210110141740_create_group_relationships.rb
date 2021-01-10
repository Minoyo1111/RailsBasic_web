class CreateGroupRelationships < ActiveRecord::Migration[6.0]
  def change
    create_table :moviegroup_relationships do |t|
      t.integer :moviegroup_id
      t.integer :user_id

      t.timestamps
    end
  end
end
