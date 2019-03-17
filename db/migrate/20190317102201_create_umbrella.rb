class CreateUmbrella < ActiveRecord::Migration[5.2]
  def change
    create_table :umbrellas do |t|
      t.text :message, null: false

      t.timestamps
    end
  end
end
