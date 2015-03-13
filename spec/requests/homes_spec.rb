require 'rails_helper'

RSpec.describe "Homes", :type => :request do
  describe "GET /homes" do
    it "Should have a h3 'Click the image to Select your character and start chat!'" do
      visit root_path
      expect(page).to have_selector('h3', text: 'Click the image to Select your character and start chat!')
    end
  end
end
