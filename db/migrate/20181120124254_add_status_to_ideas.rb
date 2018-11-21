# frozen_string_literal: true

class AddStatusToIdeas < ActiveRecord::Migration[5.2]
  def change
    add_column :ideas, :status, :integer
  end
end
