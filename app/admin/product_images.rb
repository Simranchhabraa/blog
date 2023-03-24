ActiveAdmin.register ProductImage do
    permit_params :image, :product_id
  
    index do
      selectable_column
      id_column
      column :image
      column :product_id
      column :current_sign_in_at
      column :sign_in_count
      column :created_at
      actions
    end
  
    filter :image
    filter :product_id
    filter :current_sign_in_at
    filter :sign_in_count
    filter :created_at
  
    form do |f|
      f.inputs do
        f.input :image
        f.input :product_id
      end
      f.actions
    end
end