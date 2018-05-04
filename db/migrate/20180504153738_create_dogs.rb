class CreateDogs < ActiveRecord::Migration[5.2]
  def change
    create_table :dogs do |t|
      t.string :name
      t.references :hoomin, foreign_key: true

      t.timestamps
    end
  end
end
