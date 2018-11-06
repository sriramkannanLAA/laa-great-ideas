class AddAssignedUserToIdeas < ActiveRecord::Migration[5.2]
  def change
    add_reference :ideas, :assigned_user, foreign_key: { to_table: :userts}
  end
end
