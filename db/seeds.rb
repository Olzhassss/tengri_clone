# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development? && !AdminUser.exists?(email: 'admin@example.com')

["News", "Articles"].each do |title|
    ArticleCategory.find_or_create_by!(slug: title.downcase, title:title)
end

(0..10).to_a.each do |index|
    Tag.find_or_create_by!(name: "Tag " + index.to_s)
end

essay_file = File.open(File.join(Dir.pwd,"db","essay.txt"))
essay = essay_file.read
essay_file.close

(0..50).to_a.each do |index|
    i = index.to_s
    a = Article.new(
        title: "Article " + i,
        views: rand(1..1000),
        thumb_caption: "Caption " + i,
        published_at: DateTime.now + rand(1..100).hours,
        tldr: "TLDR " + i,
        article_category_id: ["news", "articles"].sample,
        image_url: "https://tengrinews.kz/userdata/news/2024/news_531778/thumb_m/photo_468339.jpeg",
        content: essay
    )
    how_many = (0..10).to_a.sample
    ids = (0..10).to_a.sample(how_many)
    a.tags << Tag.where(id: ids)
    a.save
end