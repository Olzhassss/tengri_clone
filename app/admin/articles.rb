ActiveAdmin.register Article do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :title, :views, :thumb_caption, :published_at, :tldr, :article_category, :article_category_id, :article_category_slug, :image_url, :content, tag_ids:[]

  #
  # or
  #
  # permit_params do
  #   permitted = [:title, :views, :thumb_caption, :published_at, :tldr]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
  remove_filter :views, :thumb_caption, :article_category_id, :image_url, :tags, :content

  index do
    column :id
    column :title
    column :views
    column :published_at
    actions
  end

  form do |f|
    f.semantic_errors
    f.inputs
    f.inputs "Article Category" do
      f.input :article_category_id, as: :select, collection: ArticleCategory.all.map { |c| [c.title, c.slug] }
    end
    f.inputs "Tags" do
      f.input :tags
    end
    f.actions
  end
end
