require 'spec_helper'
require 'my_app_settings'

describe "StaticPages" do
  describe "home page" do
    it "should have the base title" do
      visit root_path
      #expect(page).to have_title(MyAppSettings.title)
      expect(page).to have_title(configus.app_title)
    end

    it "should have a custom page title" do
      visit root_path
      expect(page).to have_title('| Home')
    end
  end
end
