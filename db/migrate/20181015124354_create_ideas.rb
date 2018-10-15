class CreateIdeas < ActiveRecord::Migration[5.2]
  def change
    create_table :ideas do |t|
      t.integer :area_of_interest
      t.integer :business_area
      t.integer :it_system
      t.string :title
      t.text :idea
      t.integer :benefits
      t.text :impact
      t.integer :involvement

      t.timestamps
      t.references :user, foreign_key: true
    end
  end
end
