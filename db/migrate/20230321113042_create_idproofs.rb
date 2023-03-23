class CreateIdproofs < ActiveRecord::Migration[7.0]
  def change
    create_table :idproofs do |t|
      t.string :document
      t.string :status
      t.timestamps
    end
  end
end
