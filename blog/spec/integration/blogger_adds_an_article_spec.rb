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
        click_link "Sign Up"
        fill_in "Name", with: "Bailee"
        fill_in "Email", with: "bailee@example.com"
        fill_in "Password", with: "Bailee@1"
        fill_in "Password confirmation", with: "Bailee@1"
        click_button "Create User"
        visit root_path
        click_link "Log In"
        fill_in "Email", with: "bailee@example.com"
        fill_in "Password", with: "Bailee@1"
        click_button "Login"
        visit welcome_index_path
        click_link "My Blog"
        expect(page).to have_content("Listing articles")
        click_link "New article"
        expect(page).to have_content("New Article")
        fill_in "Title", with: "First Capybara Article"
        fill_in "Text", with: "This is a new Capybara article"
        click_button "Create Article"
        expect(page).to have_content("First Capybara Article")
        expect(page).to have_content("This is a new Capybara article")
    end
    
    scenario "Blogger successfully deletes an article" do
        visit root_path
        click_link "Sign Up"
        fill_in "Name", with: "Bailee"
        fill_in "Email", with: "bailee@example.com"
        fill_in "Password", with: "Bailee@1"
        fill_in "Password confirmation", with: "Bailee@1"
        click_button "Create User"
        visit root_path
        click_link "Log In"
        fill_in "Email", with: "bailee@example.com"
        fill_in "Password", with: "Bailee@1"
        click_button "Login"
        visit welcome_index_path
        click_link "My Blog"
        expect(page).to have_content("Listing articles")
        click_link "New article"
        expect(page).to have_content("New Article")
        fill_in "Title", with: "First Capybara Article"
        fill_in "Text", with: "This is a new Capybara article"
        click_button "Create Article"
        expect(page).to have_content("First Capybara Article")
        expect(page).to have_content("This is a new Capybara article")
        visit articles_path 
        expect(page).to have_content("Listing articles")
        click_link "Destroy"
        #click_link "Destroy" 
        page.should have_no_content("First Capybara Article") 
        page.should have_no_content("This is a new Capybara article")
    end
    
    scenario "Viewer successfully comments on an existing article" do
        visit root_path
        click_link "Sign Up"
        fill_in "Name", with: "Bailee"
        fill_in "Email", with: "bailee@example.com"
        fill_in "Password", with: "Bailee@1"
        fill_in "Password confirmation", with: "Bailee@1"
        click_button "Create User"
        visit root_path
        click_link "Log In"
        fill_in "Email", with: "bailee@example.com"
        fill_in "Password", with: "Bailee@1"
        click_button "Login"
        visit welcome_index_path
        click_link "My Blog"
        expect(page).to have_content("Listing articles")
        click_link "New article"
        expect(page).to have_content("New Article")
        fill_in "Title", with: "First Capybara Article"
        fill_in "Text", with: "This is a new Capybara article"
        click_button "Create Article"
        expect(page).to have_content("First Capybara Article")
        expect(page).to have_content("This is a new Capybara article")
        visit articles_path
        expect(page).to have_content("Listing articles")
        click_link "Show"
        expect(page).to have_content("Add a comment:") 
        fill_in "Commenter", with: "Bailee"
        fill_in "Body", with: "This is a great blog post"
        click_button "Create Comment"
        expect(page).to have_content("Bailee")
        expect(page).to have_content("This is a great blog post")
    end
end