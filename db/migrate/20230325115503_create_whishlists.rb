class CreateWhishlists < ActiveRecord::Migration[7.0]
  def change
    create_table :whishlists do |t|
      t.references :product, null: false, foreign_key: true
      t.references :merchant, null: false, foreign_key: true

      t.timestamps
    end
  end
end
