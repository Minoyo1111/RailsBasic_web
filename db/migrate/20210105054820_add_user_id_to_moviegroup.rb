class AddUserIdToMoviegroup < ActiveRecord::Migration[6.0]
  def change
    add_column :moviegroups, :user_id, :integer
  end
end
