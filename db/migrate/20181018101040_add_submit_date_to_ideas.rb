class AddSubmitDateToIdeas < ActiveRecord::Migration[5.2]
  def change
    add_column :ideas, :submission_date, :datetime, default: nil
  end
end
