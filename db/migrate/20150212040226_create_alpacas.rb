class CreateAlpacas < ActiveRecord::Migration
  def change
    create_table :alpacas do |t|
      t.string :name
      t.string :hair_color
      t.datetime :birthday
      t.integer :number_of_friends

      t.timestamps null: false
    end
  end
end
