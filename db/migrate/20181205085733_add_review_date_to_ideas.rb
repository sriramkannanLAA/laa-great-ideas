# frozen_string_literal: true

class AddReviewDateToIdeas < ActiveRecord::Migration[5.2]
  def change
    add_column :ideas, :review_date, :date, default: nil
  end
end
