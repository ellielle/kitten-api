require 'rails_helper'

RSpec.describe "Kitten requests", type: :request do
  it "gets root page" do
    get root_url
    expect(response).to have_http_status(200)
    expect(response.body).to include("Softness")
  end

  it "gets kitten creation page" do
    get create_kitten_path
    expect(response).to have_http_status(200)
    expect(response.body).to include("Create Kitten")
  end
end