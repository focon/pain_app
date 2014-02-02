require 'spec_helper'

describe "StaticPages" do

  describe "Home Page" do
    it "should have the content 'Pain App'" do
     visit '/static_pages/home'
     expect(page).to have_content('Pain App')
    end
    it "should have the title 'Pain App | Home'" do
     visit '/static_pages/home'
     expect(page).to have_title("Pain App | Home")
    end


  end

  describe "Help Page" do
    it "should have the content 'Help'" do
     visit '/static_pages/help'
     expect(page).to have_content('Help')
    end
    it "should have the title 'Pain App | Help'" do
     visit '/static_pages/help'
     expect(page).to have_title("Pain App | Help")
    end

  end

  describe "About Page" do
    it "should have the content 'About Us'" do
     visit '/static_pages/about'
     expect(page).to have_content('About Us')
    end

    it "should have the title 'Pain App | About Us'" do
     visit '/static_pages/about'
     expect(page).to have_title("Pain App | About Us")
    end
  end
end
