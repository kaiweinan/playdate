class CreatePlaydates < ActiveRecord::Migration[6.1]
  def change
    create_table :playdates do |t|
      t.string :title
      t.date :playdate
      t.timestamps
    end
  end
end
