# frozen_string_literal: true

class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.string :body
      t.integer :status_at_comment_time
      t.timestamps
      t.references :user, foreign_key: true
      t.references :idea, foreign_key: true
    end
  end
end
