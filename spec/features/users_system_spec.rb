require 'rails_helper'

RSpec.describe 'User', type: :feature do
  before(:each) do
    @abel = User.create(name: 'Abel Tsegaye', photo: 'https://abellinktophoto.jpg', bio: 'Make a diffrence', posts_counter: 0)
    @sam = User.create(name: 'Samuel', photo: 'https://samlinktophoto.jpg', bio: 'be the diffrence', posts_counter: 0)
    visit users_path
  end

  describe 'user#index' do
    it 'should show the username of all other users.' do
      expect(page).to have_content(@abel.name)
      expect(page).to have_content(@sam.name)
    end
    it 'should show the profile picture for each user.' do
      expect(page).to have_xpath("//img[contains(@src,'https://abellinktophoto.jpg')]")
    end
    it 'should show number of posts each user has written.' do
      expect(page).to have_content 'Number of posts: 0'
    end

    it 'should redirected to that user show page, When I click on a user' do
      click_link 'Abel Tsegaye'
      expect(page).to have_current_path("/users/#{@abel.id}")
    end
  end

  describe 'user#show' do
    it 'can see the user profile picture.'
    it 'I can see the user username.'
    it 'I can see the number of posts the user has written.'
    it 'I can see the user bio.'
    it 'I can see the user first 3 posts.'
    it 'I can see a button that lets me view all of a users posts.'
    it 'When I click a users post, it redirects me to that posts show page.'
    it 'When I click to see all posts, it redirects me to the users posts index page.'
  end
end
