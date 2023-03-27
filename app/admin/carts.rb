ActiveAdmin.register Cart do
    permit_params :quantity, :product_id, :merchant_id
  
    index do
      selectable_column
      id_column
      column :quantity
      column :product_id
      column :merchant_id
      column :current_sign_in_at
      column :sign_in_count
      column :created_at
      actions
    end
  
    filter :quantity
    filter :product_id
    filter :merchant_id
    filter :current_sign_in_at
    filter :sign_in_count
    filter :created_at
  
    form do |f|
      f.inputs do
        f.input :quantity
        f.input :product_id
        f.input :merchant_id
      end
      f.actions
    end
end