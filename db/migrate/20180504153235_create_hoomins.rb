class CreateHoomins < ActiveRecord::Migration[5.2]
  def change
    create_table :hoomins do |t|
      t.string :name

      t.timestamps
    end
  end
end
