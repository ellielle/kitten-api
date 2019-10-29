require "rails_helper"

RSpec.describe "Kitten management", type: :system do
  before do
    driven_by(:rack_test)
  end

  context "when visiting root page" do
    it "displays all kittens created" do
      create(:kitten).valid?
      visit root_url
      expect(page.status_code).to be(200)
      expect(page).to have_content("Meowmix").and have_content("Super Floof")
    end

    it "links to create new kitten page" do
      visit root_url
      expect(page).to have_content("Create New Kitten")
      click_link("Create New Kitten")
      expect(page.status_code).to be(200)
      expect(current_path).to eq(create_kitten_path)
    end
  end

  context "when creating new kitten" do
    it "displays correct page" do
      create(:kitten).valid?
      visit create_kitten_path
      expect(page.status_code).to be(200)
      fill_in("Name", with: "Sora")
      fill_in("Age", with: 8)
      select("Purrfect", from: "Softness")
      select("Magnificent", from: "Cuteness")
      click_button("Create Kitten")
      expect(current_path).to eq(kitten_path(2))
      expect(page.status_code).to be(200)
    end
  end
end