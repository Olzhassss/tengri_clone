module ArticlesHelper
    def sort_link(column:, label:, direction: "desc", active: false)
        link_to(label, feed_articles_path(column: column, direction: direction), data: { turbo_frame: "feed" }, class: "feed-link " + (active ? "active": ""))
    end
end
