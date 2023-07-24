require 'rails_helper'

RSpec.describe 'User', type: :feature do
  before(:each) do
    @abel = User.create(name: 'Abel Tsegaye', photo: 'https://abellinktophoto.jpg', bio: 'Make a diffrence',
                        posts_counter: 0)
    @sam = User.create(name: 'Samuel', photo: 'https://samlinktophoto.jpg', bio: 'be the diffrence', posts_counter: 0)
  end

  describe 'user#index' do
    before(:each) do
      visit users_path
    end
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
    before(:each) do
      @abelt = User.create(name: 'Abel', photo: 'https://abellinktophoto.jpg', bio: 'Make a diffrence',
                           posts_counter: 0)
      @post1 = Post.create(title: 'post 1 title',
                           text: 'post content 1',
                           comment_counter: 0,
                           likes_counter: 0,
                           author: @abelt)
      @post2 = Post.create(title: 'post 2 title',
                           text: 'post content 2',
                           comment_counter: 0,
                           likes_counter: 0,
                           author: @abelt)
      @post3 = Post.create(title: 'post 3 title',
                           text: 'post content 3',
                           comment_counter: 0,
                           likes_counter: 0,
                           author: @abelt)
      @post4 = Post.create(title: 'post 4 title',
                           text: 'post content 4',
                           comment_counter: 0,
                           likes_counter: 0,
                           author: @abelt)

      visit user_path(@abelt.id)
    end
    it 'should show the profile picture for each user.' do
      expect(page).to have_xpath("//img[contains(@src,'https://abellinktophoto.jpg')]")
    end
    it 'should show the username of all other users.' do
      expect(page).to have_content(@abelt.name)
      expect(page).to_not have_content(@sam.name)
    end
    it 'should show number of posts each user has written.' do
      expect(page).to have_content 'Number of posts: 4'
    end
    it 'I can see the user bio.' do
      expect(page).to have_content 'Make a diffrence'
    end
    it 'I can see the user first 3 posts.' do
      expect(page).to_not have_content 'post content 4'
    end
    it 'I can see a button that lets me view all of a users posts.' do
      expect(page).to have_content 'See all Posts'
    end
    it 'When I click a users post, it redirects me to that posts show page.' do
      visit "/users/#{@abelt.id}/posts/#{@post1.id}"
      expect(page).to have_content 'post content 1'
    end
    it 'When I click to see all posts, it redirects me to the users posts index page.' do
      click_link 'See all Posts'
      expect(page).to have_content 'post 1 title'
    end
  end
end
