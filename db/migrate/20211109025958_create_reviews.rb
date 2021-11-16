class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.integer :user_id
      t.integer :playdate_id
      t.string :description
      t.timestamps
    end
  end
end
