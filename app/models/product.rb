class Product < ApplicationRecord
   belongs_to :category
   has_many :product_image, dependent: :destroy
   validates :name, :desc, :category_id, :price, presence: true
    validates :status, presence: true
    #enum status: { draft: 'draft', active: 'active', inactive: 'inactive' },_default: :draft
end
