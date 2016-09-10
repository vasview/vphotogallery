ActiveAdmin.register Photo do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

permit_params :caption, :user_id, :image

form do |f|
		f.inputs do
		f.input :caption
		f.input :user
		f.input :image, :as => :file, :hint => image_tag(f.object.image.url(:small))
		end
		f.actions
	end

	index do
		selectable_column
		id_column
		column :user
		column :caption
		column :image do |place|
			image_tag place.image.url(:small)
		end

		actions
	end

	show do
		attributes_table do
			row :user
			row :caption
			row :image do |place|
				image_tag place.image.url(:medium)
			end
		end
		active_admin_comments
	end 
end
