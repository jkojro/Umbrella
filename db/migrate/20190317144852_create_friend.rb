class CreateFriend < ActiveRecord::Migration[5.2]
  def change
    create_table :friends do |t|
      t.string :email, null: false
      t.text :answear, null: false
      t.references :umbrela, foreign_key: true
    end
  end
end
