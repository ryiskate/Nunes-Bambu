ActiveAdmin.register Product do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#

permit_params :category_id, :name, :price, :description, images_attributes: [:id, :img]

form do |f|
    f.inputs do
      input :category
      input :name
      input :description
      input :price
    end
    
    f.has_many :images do |i|
      i.input :img, as: :file
    end
      
    f. actions
    
  end


end
