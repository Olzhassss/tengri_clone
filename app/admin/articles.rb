ActiveAdmin.register Article do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :title, :views, :thumb_caption, :published_at, :tldr
  #
  # or
  #
  # permit_params do
  #   permitted = [:title, :views, :thumb_caption, :published_at, :tldr]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
  remove_filter :views, :thumb_caption

end
