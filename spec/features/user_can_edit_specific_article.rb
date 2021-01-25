require "rails_helper"

describe "user edits existing article" do
  describe "they link from the articles show" do
    describe "they fill in a title and body" do
      it "edits a new article" do
        article = Article.create(title: "Edit me!", body: "Show me how to edit!")

        visit article_path(article)
        click_link "Edit"

        expect(current_path).to eq(edit_article_path(article))

        fill_in "article[title]", with: "New Title!"
        fill_in "article[body]",  with: "New Body!"
        click_on "Update Article"

        expect(page).to have_content("New Title!")
        expect(page).to have_content("New Body!")
        expect(page).to have_content("Article Your Updated Title was updated.")
      end
    end
  end
end