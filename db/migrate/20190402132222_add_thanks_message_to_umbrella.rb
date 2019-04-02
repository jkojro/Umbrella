class AddThanksMessageToUmbrella < ActiveRecord::Migration[5.2]
  def change
    add_column :umbrellas, :thanks_message, :text
  end
end
