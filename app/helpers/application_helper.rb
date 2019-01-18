module ApplicationHelper
    def markdown(text)
        renderer = Redcarpet::Render::HTML.new(no_links: true, hard_wrap: true)
        markdown = Redcarpet::Markdown.new(renderer, extensions = {})
        markdown.render(text).html_safe
    end
end
