require 'rails_helper.rb'

feature"Blogger adds an article" do
    scenario "Blogger successfully navigates to the new articles page from the listing articles page" do
        visit articles_path
        expect(page).to have_content("Listing articles")
        click_link "New article"
        expect(page).to have_content("New Article")
        expect(page).to have_field("Title")
        expect(page).to have_field("Text")
    end
    
    scenario "Blogger successfully creates a new article" do
        visit root_path
        click_link "Log In"
        fill_in "Email", with: "bailee@example.com"
        fill_in "Password", with: "bailee"
        click_button "Login"
        visit welcome_index_path
        click_link "My Blog"
        visit new_article_path
        expect(page).to have_content("New Article")
        fill_in "Title", with: "New Capybara Article"
        fill_in "Text", with: "This is a new Capybara article"
        click_button "Create Article"
        expect(page).to have_content("New Capybara Article")
        expect(page).to have_content("This is a new Capybara article")
    end
    
    scenario "Blogger successfully deletes an article" do
        visit articles_path 
        expect(page).to have_content("Listing articles")
        first(".destroy_button").click_link "Destroy"
        #click_link "Destroy" #how to delete a specific article
        page.should have_no_content("Title") #proper syntax to check that the article does not exist
        page.should have_no_content("Text")
    end
    
    scenario "Viewer successfully comments on an existing article" do
        visit new_article_comment_path(Article.first) #how to denote certain article
        expect(page).to have_content("Add a comment:") #what is the name of the page with link show
        fill_in "Commenter", with: "Bailee"
        fill_in "Body", with: "This is a great blog post"
        click_buttom "Create Comment"
        expect(page).to have_content("Bailee")
        expect(page).to have_content("This is a great blog post")
    end
end