class Cart < ApplicationRecord
    
    belongs_to :merchant 
    belongs_to :product 
    validates :product_id, :merchant_id, presence: true
end
