class Locations < ActiveRecord::Migration[6.1]
  def change
    def change
      create_table :locations do |t|
        t.string :place
        t.timestamps
      end
    end
  end
end
