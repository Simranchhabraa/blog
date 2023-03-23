class AddMerchantToIdproof < ActiveRecord::Migration[7.0]
  def change
    add_reference :idproofs, :merchant, null: false, foreign_key: true
  end
end
