require "rails_helper"

RSpec.describe "Kitten management", type: :system do
  before do
    driven_by(:rack_test)
  end

  context "when visiting root page" do
    it "displays all kittens created" do
      create(:kitten).valid?
      visit root_path
      expect(page.status_code).to be(200)
      expect(page).to have_content("Meowmix").and have_content("Super Floof")
    end

    it "links to create new kitten page" do
      visit root_path
      expect(page).to have_content("Create New Kitten")
      click_link("Create New Kitten")
      expect(page.status_code).to be(200)
      expect(current_path).to eq(create_kitten_path)
    end

    it "has all links that it should" do
      visit root_path
      expect(page).to have_css(".github-icon")
      expect(page).to have_css("a[href='https://github.com/ellielle/kitten-api']")
      expect(page).to have_css(".navbar-brand")
      expect(page).to have_css("a[href='#{root_path}']")
      expect(page).to have_css("a[href='#{create_kitten_path}']")
    end
  end

  context "when creating new kitten" do
    it "accepts and redirects to correct page" do
      create(:kitten).valid?
      visit create_kitten_path
      expect(page.status_code).to be(200)
      fill_in("Name", with: "Sora")
      fill_in("Age", with: 8)
      select("Purrfect", from: "Softness")
      select("Magnificent", from: "Cuteness")
      click_button("Create Kitten")
      expect(page.status_code).to be(200)
      expect(current_path).to eq(kitten_path(2))
      expect(page).to have_content("Kitten created!")
    end

    it "rejects invalid information" do
      visit create_kitten_path
      expect(page.status_code).to be(200)
      fill_in("Name", with: "Clover")
      fill_in("Age", with: "a")
      select("Purrfect", from: "Softness")
      select("Magnificent", from: "Cuteness")
      click_button("Create Kitten")
      expect(current_path).to eq(create_kitten_path)
      expect(page).to have_content("Invalid input.")
    end
  end
end