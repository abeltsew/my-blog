require 'rails_helper'

RSpec.describe 'User', type: :feature do
  before(:each) do
    @abel = User.create(name: 'Abel Tsegaye', photo: 'https://abellinktophoto.jpg', bio: 'Make a diffrence',
                        posts_counter: 0)
    @sam = User.create(name: 'Samuel', photo: 'https://samlinktophoto.jpg', bio: 'be the diffrence', posts_counter: 0)
  end

  describe 'post index' do
    it 'I can see the users profile picture.'
    it 'I can see the users username.'
    it 'I can see the number of posts the user has written.'
    it 'I can see a posts title.'
    it 'I can see some of the posts body.'
    it 'I can see the first comments on a post.'
    it 'I can see how many comments a post has.'
    it 'I can see how many likes a post has.'
    it 'I can see a section for pagination if there are more posts than fit on the view.'
    it 'When I click on a post, it redirects me to that posts show page.'
  end

  describe 'post show' do
    it 'I can see the posts title.'
    it 'I can see who wrote the post.'
    it 'I can see how many comments it has.'
    it 'I can see how many likes it has.'
    it 'I can see the post body.'
    it 'I can see the username of each commentor.'
    it 'I can see the comment each commentor left.'
  end
end
