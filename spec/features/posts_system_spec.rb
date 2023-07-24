require 'rails_helper'

RSpec.describe 'User', type: :feature do
  before(:each) do
    @abel = User.create(name: 'Abel Tsegaye', photo: 'https://abellinktophoto.jpg', bio: 'Make a diffrence',
                        posts_counter: 0)
    @sam = User.create(name: 'Samuel', photo: 'https://samlinktophoto.jpg', bio: 'be the diffrence', posts_counter: 0)
    @post1 = Post.create(title: 'post 1 title',
      text: 'post content 1',
      comment_counter: 0,
      likes_counter: 0,
      author: @abel)
    @comment1 = Comment.create(text: 'First comment from Abel', author_id: @abel.id, post_id: @post1.id)
  end

  describe 'post index' do
    before(:each) do
      visit "/users/#{@abel.id}/posts"
    end
    it 'I can see the user\'s profile picture.' do
      expect(page).to have_xpath("//img[contains(@src,'https://abellinktophoto.jpg')]")
    end
    it 'I can see the user\'s username.' do
      expect(page).to have_content(@abel.name)
    end
    it 'I can see the number of posts the user has written.' do
      expect(page).to have_content 'Number of posts: 1'
    end
    it 'I can see a post\'s title.' do
      expect(page).to have_content 'post 1 title'
    end
    it 'I can see some of the post\'s body.' do
      expect(page).to have_content 'post content 1'
    end
    it 'I can see the first comments on a post.' do
      expect(page).to have_content 'First comment from Abel'
    end
    it 'I can see how many comments a post has.' do
      expect(page).to have_content 'Comments: 1'
      expect(page).to_not have_content 'Comments: 0'
    end
    it 'I can see how many likes a post has.' do
      expect(page).to_not have_content 'Likes: 1'
      expect(page).to have_content 'Likes: 0'
    end
    it 'I can see a section for pagination if there are more posts than fit on the view.' do
      expect(page).to have_content 'Pagination'
    end
    it 'When I click on a post, it redirects me to that posts show page.' do
      click_link 'post 1 title'
      expect(page).to have_content 'post 1 title by Abel Tsegaye'
    end
  end

  describe 'post show' do
    before(:each) do
      visit "/users/#{@abel.id}/posts/#{@post1.id}"
    end
    it 'I can see the posts title.' do
      expect(page).to have_content 'post 1 title'
    end
    it 'I can see who wrote the post.' do
      expect(page).to have_content 'Abel Tsegaye'
      expect(page).to have_content 'post 1 title by Abel Tsegaye'
    end
    it 'I can see how many comments it has.' do
      expect(page).to have_content 'Comments: 1'
      expect(page).to_not have_content 'Comments: 0'
    end
    it 'I can see how many likes it has.' do
      expect(page).to have_content 'likes: 0'
      expect(page).to_not have_content 'likes: 1'
    end
    it 'I can see the post body.' do
      expect(page).to have_content 'post content 1'
    end
    it 'I can see the username of each commentor.' do
      expect(page).to have_content "#{@abel.name}"
    end
    it 'I can see the comment each commentor left.' do
      expect(page).to have_content 'First comment from Abel'
    end
  end
end
