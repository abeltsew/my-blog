require 'rails_helper'

RSpec.describe Post, type: :request do
  let(:user) { User.create(name: 'Abel Tsegaye', photo: 'link to photo', bio: 'Make a diffrence', posts_counter: 0) }
  let(:post) do
    @post = Post.create(
      title: 'Ai take over the world',
      text: 'Ai take over the world by taking over the world',
      author_id: user.id,
      comment_counter: 1,
      likes_counter: 0
    )
  end

  describe '#post' do
    it 'should render the post index' do
      get "/users/#{user.id}/posts"
      expect(response.status).to eq(200)
      expect(response).to render_template('posts/index')
      expect(response.body).to include 'Pagination'
    end

    it 'should render the post show' do
      get "/users/#{user.id}/posts/#{post.id}"
      expect(response.status).to eq(200)
      expect(response).to render_template('posts/show')
      expect(response.body).to include '<p>Ai take over the world by Abel Tsegaye</P>'
    end
  end
end
