ActiveAdmin.register Product do
  index do
    selectable_column
    id_column
    column :title
    column :body
    column :price
    column :created_at
    column :updated_at
    column('Reviews') {|product| link_to 'Review', admin_product_reviews_path(product) }
    column('Images') {|product| link_to 'Images', admin_product_images_path(product) }
    actions
  end
end
