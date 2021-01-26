require "rails_helper"

describe "user sees one article" do
  describe "they link from the articles index" do
    it "displays information for one article" do
      article_1 = Article.create(title: "Sample Title 1", body: "Sample Body Text 1")
      article_1 = Article.create(title: "Sample Title 2", body: "Sample Body Text 2")
      comment_1 = article.comments.create(author_name: "Me", body: "Commenty comments")
      comment_2 = article.comments.create(author_name: "You", body: "So much to say")

      visit articles_path
      click_link article_1.title

      expect(page).to have_content(article_1.title)
      expect(page).to have_content(article_1.body)
      expect(page).to have_content(comment_1.author_name)
      expect(page).to have_content(comment_1.body)
      expect(page).to have_content(comment_2.author_name)
      expect(page).to have_content(comment_2.body)
    end
  end
end